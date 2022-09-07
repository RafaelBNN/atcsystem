MACHINE
    atcsystem
    
SEES
    
    atcsystem_ctx
    
VARIABLES
    
    map,
    aircraftInfo
    
INVARIANT
    
    map : struct(xx : (0..3), yy : (0..3)) --> struct(state : STATE, airport : BOOL)
    
    & aircraftInfo : AIRCRAFT >+> struct(
                                        idd : NAT,
                                        hdng : DIRECTION,
                                        currpos : dom(map)
                                    )
                                    
    & ! (aa, bb) . (aa : AIRCRAFT & bb : AIRCRAFT =>
                    ((aircraftInfo(aa))'idd = (aircraftInfo(bb))'idd =>
                    aa = bb)) // duas aeronaves nao podem ter o mesmo idd
            
    & card(aircraftInfo) <= capacity
    
INITIALISATION
    
    map := (struct(xx : (0..3), yy : (0..3)) * {rec(state : CLEAR, airport : FALSE)})
            <+ {
                rec(xx : 1, yy : 1) |-> rec(state : CLEAR, airport : TRUE),
                rec(xx : 0, yy : 3) |-> rec(state : CLEAR, airport : TRUE),
                rec(xx : 3, yy : 3) |-> rec(state : CLEAR, airport : TRUE)
               }
    || aircraftInfo := {}
            
//    || aircraftInfo := {A1 |-> rec(idd : 0, hdng : NN, currpos : rec(xx : 2, yy : 2)),
//                        A3 |-> rec(idd : 1, hdng : SS, currpos : rec(xx : 1, yy : 3))}
    
    
OPERATIONS
    
    makeAircraft =
    BEGIN
        ANY 
            ap, ac, iid, hd
        WHERE
            ap : {cc | cc : dom(map)
                & (map(cc))'airport = TRUE
                & (map(cc))'state = CLEAR}
            & ac : AIRCRAFT - dom(aircraftInfo)
            & iid : NAT - {ids | ids : NAT 
                & # aa . (aa : AIRCRAFT & (aircraftInfo(aa))'idd = iid)}
            & hd : DIRECTION
        THEN
            aircraftInfo := aircraftInfo \/ 
                    {ac |-> rec(
                            idd : iid,
                            hdng : hd,
                            currpos : rec(xx : ap'xx, yy : ap'yy))}
            || map := map <+ {ap |-> rec(state : OCCUPIED, airport : TRUE)}
        END
    END

END
