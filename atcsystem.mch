MACHINE
    atcsystem
    
SEES
    
    atcsystem_ctx
    
VARIABLES
    
    map,
    aircraftInfo
    
INVARIANT
    
    map : struct(xx : (0..3), yy : (0..3)) --> struct(state : STATE, airport : BOOL)
    & aircraftInfo : AIRCRAFT +-> struct(
                                        idd : NAT,
                                        hdng : DIRECTION,
                                        currpos : dom(map)
                                        )
    
INITIALISATION
    
    map := (struct(xx : (0..3), yy : (0..3)) * {rec(state : CLEAR, airport : FALSE)})
            <+ {
                rec(xx : 1, yy : 1) |-> rec(state : CLEAR, airport : TRUE),
                rec(xx : 0, yy : 3) |-> rec(state : CLEAR, airport : TRUE),
                rec(xx : 3, yy : 3) |-> rec(state : CLEAR, airport : TRUE)
               }
            
    || aircraftInfo := {A1 |-> rec(idd : 0, hdng : NN, currpos : rec(xx : 2, yy : 2)),
                        A3 |-> rec(idd : 1, hdng : SS, currpos : rec(xx : 1, yy : 3))}
    
    
OPERATIONS
    
    makeAircraft(cc) = // cc for coordinate
    PRE
        cc : dom(map)
        & (map(cc))'airport = TRUE
    THEN
        map(cc) := rec(state : OCCUPIED, airport : TRUE)
        || aircraftInfo := aircraftInfo \/ 
                {A2 |-> rec(
                        idd : 2,
                        hdng : NN,
                        currpos : rec(xx : cc'xx, yy : cc'yy))}
    END

END
