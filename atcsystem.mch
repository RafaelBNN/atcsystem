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
            
    & card(aircraftInfo) <= capacity
    
    // duas aeronaves nao podem ter o mesmo idd       
    & ! (aa, bb) . (aa : AIRCRAFT & bb : AIRCRAFT =>
                    ((aircraftInfo(aa))'idd = (aircraftInfo(bb))'idd =>
                    aa = bb))
            
    // duas aeronaves nao podem ter a mesma posicao
    & ! (aa, bb) . (aa : AIRCRAFT & bb : AIRCRAFT =>
                    ((aircraftInfo(aa))'currpos = (aircraftInfo(bb))'currpos =>
                    aa = bb))
            
    // uma posicao esta ocupada sse existe uma aeronave la
    & ! cc . (cc : dom(map) =>
                ((map(cc))'state = OCCUPIED =>
                # aa . (aa : dom(aircraftInfo) & (aircraftInfo(aa))'currpos = cc)))
    & ! aa . (aa : AIRCRAFT =>
                ((map((aircraftInfo(aa))'currpos))'state = OCCUPIED))

    // uma posicao esta livre sse nao existe nenhuma aeronave la
    & ! cc . (cc : dom(map) =>
                ((map(cc))'state = CLEAR =>
                ! aa . (aa : dom(aircraftInfo) => ((aircraftInfo(aa))'currpos /= cc))))
    & ! cc . (cc : dom(map) =>
                (! aa . (aa : dom(aircraftInfo) => ((aircraftInfo(aa))'currpos /= cc)) =>
                (map(cc))'state = CLEAR))    
    
INITIALISATION
    
    map := (struct(xx : (0..3), yy : (0..3)) * {rec(state : CLEAR, airport : FALSE)})
            <+ { // adicionando os aeroportos
                    rec(xx : 1, yy : 1) |-> rec(state : CLEAR, airport : TRUE),
                    rec(xx : 0, yy : 3) |-> rec(state : CLEAR, airport : TRUE),
                    rec(xx : 3, yy : 3) |-> rec(state : CLEAR, airport : TRUE)
               }
    || aircraftInfo := {}    
    
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
            & iid : NAT
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
    END;
    
    landAircraft(aa) =
    PRE
        aa : dom(aircraftInfo)
        & (aircraftInfo(aa))'currpos : {cc | cc : dom(map) & (map(cc))'airport = TRUE}
    THEN
        CHOICE
            aircraftInfo := {aa} <<| aircraftInfo
            || 
            LET apos BE apos = (aircraftInfo(aa))'currpos IN
                map := map <+ {apos |-> rec(state : CLEAR, airport : (map(apos))'airport)}
            END
        OR
            aircraftInfo := aircraftInfo <+ {aa |-> rec(
                                    idd : (aircraftInfo(aa))'idd,
                                    hdng : WW,
                                    currpos : (aircraftInfo(aa))'currpos)}
        END
    END
    
//    advanceTime =
//    BEGIN
//        aircraftInfo := aircraftInfo <+
//                        {aa |-> rec(idd : (aircraftInfo(aa))'idd,
//                                hdng : (aircraftInfo(aa))'hdng,
//                                currpos : nextpos) |
//                         aa : dom(map) 
//                         & nextpos : dom(map)}
//    END

END
