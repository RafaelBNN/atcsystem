MACHINE
    atcsystem
    
SEES
    
    atcsystem_ctx
    
VARIABLES
    
    aircraftInfo, time
    
INVARIANT
    
    aircraftInfo : AIRCRAFT >+> struct(
                                        hdng : DIRECTION,
                                        currpos : map
                                    )
    & time : NAT
    & card(aircraftInfo) <= capacity
    
    // duas aeronaves nao podem ter a mesma posicao
    & ! (aa, bb) . (aa : AIRCRAFT & bb : AIRCRAFT =>
                    ((aircraftInfo(aa))'currpos = (aircraftInfo(bb))'currpos =>
                    aa = bb))

    
INITIALISATION
    
    aircraftInfo := {   
                    A1 |-> rec(hdng : NN, currpos : rec(xx : 3, yy : 3)),
                    A2 |-> rec(hdng : NN, currpos : rec(xx : 2, yy : 2))
                    }
    || time := 0

OPERATIONS
    
    makeAircraft(ap) =
    PRE
        ap : ran(airport)
        & ! aa . (aa : dom(aircraftInfo) => (aircraftInfo(aa))'currpos /= ap)
        & card(aircraftInfo) < capacity
    THEN
    BEGIN
            ANY 
                ac, hd
            WHERE
                ac : AIRCRAFT - dom(aircraftInfo)
                & hd : DIRECTION
            THEN
                aircraftInfo := aircraftInfo \/ {ac |-> rec(hdng : hd, currpos : ap)}
            END
        END
    END;
    
    landAircraft(aa) =
    PRE
        aa : dom(aircraftInfo)
        & # cc . (cc : ran(airport) & (aircraftInfo(aa))'currpos = cc)
    THEN
        aircraftInfo := {aa} <<| aircraftInfo
    END;
    
    changeDirection(aa, hh) =
    PRE
        aa : dom(aircraftInfo)
        & hh : DIRECTION
        & hh /= (aircraftInfo(aa))'hdng
    THEN
        aircraftInfo := aircraftInfo <+ {aa |-> rec(hdng : hh, currpos : (aircraftInfo(aa))'currpos)}
    END;
    
    advanceTime(nextPositions) =
    PRE
        nextPositions : AIRCRAFT +-> (INT*INT)
        & nextPositions = { aa, pp |
                aa : AIRCRAFT & aa : dom(aircraftInfo) & pp : (INT*INT) &
                ((aircraftInfo(aa))'hdng = NN =>
                    pp = (((aircraftInfo(aa))'currpos)'xx,
                          ((aircraftInfo(aa))'currpos)'yy-1)) &
                ((aircraftInfo(aa))'hdng = SS =>
                    pp = (((aircraftInfo(aa))'currpos)'xx,
                          ((aircraftInfo(aa))'currpos)'yy+1)) &
                ((aircraftInfo(aa))'hdng = EE =>
                    pp = (((aircraftInfo(aa))'currpos)'xx+1,
                          ((aircraftInfo(aa))'currpos)'yy)) &
                ((aircraftInfo(aa))'hdng = WW =>
                    pp = (((aircraftInfo(aa))'currpos)'xx-1,
                          ((aircraftInfo(aa))'currpos)'yy))
            }
       & card(dom(nextPositions)) = card(ran(nextPositions)) 
       & ! pp . (pp : ran(nextPositions) =>
               (prj1(INT,INT))(pp) >= 0 & (prj2(INT,INT))(pp) >= 0 &
               (prj1(INT,INT))(pp) <= mapw & (prj2(INT,INT))(pp) <= maph)
    THEN
        aircraftInfo := { aa,ii |
                aa : dom(nextPositions) &                
                ii = rec(hdng : (aircraftInfo(aa))'hdng,
                         currpos : rec(xx : (prj1(INT,INT))(nextPositions(aa)),
                                       yy : (prj2(INT,INT))(nextPositions(aa))))
            }
        || time := time + 1
    END

END
