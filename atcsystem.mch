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
            
    // a posicao em que uma aeronave se encontra sempre deve estar ocupada
    & ! aa . (aa : AIRCRAFT =>
                ((map((aircraftInfo(aa))'currpos))'state = OCCUPIED))
            
    // se uma posicao esta ocupada, entao existe uma aeronave la
    & ! cc . (cc : dom(map) =>
                ((map(cc))'state = OCCUPIED =>
                # aa . (aa : dom(aircraftInfo) & (aircraftInfo(aa))'currpos = cc)))
            
    // uma posicao sem nenhuma aeronave deve estar livre
    & ! cc . (cc : dom(map) =>
                (! aa . (aa : dom(aircraftInfo) => ((aircraftInfo(aa))'currpos /= cc)) =>
                (map(cc))'state = CLEAR))    
    
    // se uma posicao esta livre, entao nao existe nenhuma aeronave la
    & ! cc . (cc : dom(map) =>
                ((map(cc))'state = CLEAR =>
                ! aa . (aa : dom(aircraftInfo) => ((aircraftInfo(aa))'currpos /= cc))))
    
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
    END
    
//    landAircraft(aa) =
//    PRE
//        aa : dom(aircraftInfo)
//        & (aircrafInfo(aa))'currpos : {cc | cc : dom(map) & (map(cc))'airport = TRUE}
//    THEN
//        CHOICE
//            
//    END
//    
//    advanceTime =
//    BEGIN
//        aircraftInfo := aircraftInfo <+
//                        {aa |-> rec
//    END

END
