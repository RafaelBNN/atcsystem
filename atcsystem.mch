MACHINE
    atcsystem
    
SEES
    
    atcsystem_ctx
    
VARIABLES
    
    zone_states,
    curr_aircrafts,
    ids,
    spdlmt,
    altlmt,
    currpos,
    hdng,
    currspd,
    curralt,
    test
    
INVARIANT
    
    zone_states : mapa --> STATE
    
    & test : NAT
    
    // talvez seja dificil utilizar struct porque, nas funcoes de speedup ou change_direction, por exemplo, torna-se complexo acessar uma aeronave especifica sem ter que passar toda ela como argumento da funcao
    
    & ids : AIRCRAFT >+> (0..capacity-1) // duas aeronaves nao podem ter o mesmo id
    & spdlmt : AIRCRAFT +-> NAT1
    & altlmt : AIRCRAFT +-> NAT1
    & currpos : AIRCRAFT >+> struct(posx : (0..mapw), posy : (0..maph)) // duas aeronaves nao podem ter a mesma posicao atual
    & hdng : AIRCRAFT +-> DIRECTION
    & currspd : AIRCRAFT +-> NAT1
    & curralt : AIRCRAFT +-> NAT1
    
    & curr_aircrafts : NAT
    
    & card(ids) = curr_aircrafts
    & card(spdlmt) = curr_aircrafts
    & card(altlmt) = curr_aircrafts
    & card(hdng) = curr_aircrafts
    & card(currspd) = curr_aircrafts
    & card(curralt) = curr_aircrafts
    
INITIALISATION
    
    zone_states := {
        (0,0) |-> CLEAR, (0,1) |-> CLEAR, (0,2) |-> CLEAR, (0,3) |-> CLEAR,
        (1,0) |-> CLEAR, (1,1) |-> CLEAR, (1,2) |-> CLEAR, (1,3) |-> CLEAR,
        (2,0) |-> CLEAR, (2,1) |-> CLEAR, (2,2) |-> CLEAR, (2,3) |-> CLEAR,
        (3,0) |-> CLEAR, (3,1) |-> CLEAR, (3,2) |-> CLEAR, (3,3) |-> CLEAR
    }
    || curr_aircrafts := 0
    || ids := {}
    || spdlmt := {}
    || altlmt := {}
    || currpos := {}
    || hdng := {}
    || currspd := {}
    || curralt := {}
    
    || test := 0
    
OPERATIONS
    
    takeoff_from(aa, pp) =
    PRE
        aa : AIRCRAFT
        & pp : airport
        & zone_states(pp'xx, pp'yy) = CLEAR
//        & zone_states(prj1(pp), prj2(pp)) = CLEAR
        & curr_aircrafts < capacity
    THEN
        ids := ids \/ {aa |-> curr_aircrafts + 1}
        || spdlmt := spdlmt \/ {aa |-> 1}
        || altlmt := altlmt \/ {aa |-> 1}
        || hdng := hdng \/ {aa |-> NN}
        || currspd := currspd \/ {aa |-> 3}
        || curralt := curralt \/ {aa |-> 3}
        || curr_aircrafts := curr_aircrafts + 1
        || zone_states(pp'xx, pp'yy) := OCCUPIED
    END;
    
    change_direction(ii, hh) =
    PRE
        ii : ran(ids)
        & hh : DIRECTION - {hdng(ids~(ii))}
    THEN
        hdng(ids~(ii)) := hh
    END;
    
    speedup(ii) =
    PRE
        ii : ran(ids)
        & currspd(ids~(ii)) < (spdlmt(ids~(ii)))
    THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
        currspd(ids~(ii)) := currspd(ids~(ii)) + 1
    END;
    
    slowdown(ii) =
    PRE
        ii : ran(ids)
        & currspd(ids~(ii)) < 1
    THEN
        currspd(ids~(ii)) := currspd(ids~(ii)) - 1
    END;
    
    advance_time(ii) =
    PRE
        ii : ran(ids)
    THEN
        LET aa, pos BE
            aa = ids~(ii)
            & pos = currpos(aa)
        IN
            IF hdng(aa) = NN THEN
                IF ((currpos(aa))'posy >= currspd(aa)) THEN
                    currpos := currpos <+ {aa |-> rec(posx : pos'posx, posy : pos'posy - currspd(aa))}
                END
            ELSIF hdng(aa) = SS THEN
                IF (currpos(aa))'posy <= maph - currspd(aa) THEN
                    currpos := currpos <+ {aa |-> rec(posx : pos'posx, posy : pos'posy + currspd(aa))}
                END
            ELSIF hdng(aa) = WW THEN
                IF (currpos(aa))'posx >= currspd(aa) THEN
                    currpos := currpos <+ {aa |-> rec(posx : pos'posx - currspd(aa), posy : pos'posy)}
                END
            ELSE // EE
                IF (currpos(aa))'posx <= currspd(aa) THEN
                    currpos := currpos <+ {aa |-> rec(posx : pos'posx + currspd(aa), posy : pos'posy)}
                END
            END
        END
    END
    
//    advance_time =
//    BEGIN
//        test := 0 ||
//        WHILE iter < curr_aircrafts DO
//            LET aa BE aa = ids~(iter) IN
//                IF hdng(aa) = NN THEN
//                    IF currpos(aa)'posy >= currspd(aa) THEN
//                        currpos(aa)'posy := currpos(aa)'posy - currspd(aa)
//                    END
//                ELSIF hdng(aa) = SS THEN
//                    IF currpos(aa)'posy <= maph - currspd(aa) THEN
//                        currpos(aa)'posy := currpos(aa)'posy + currspd(aa)
//                    END
//                ELSIF hdng(aa) = WW THEN
//                    IF currpos(aa)'posx >= currspd(aa) THEN
//                        currpos(aa)'posx := currpos(aa)'posx - currspd(aa)
//                    END
//                ELSE // EE
//                    IF currpos(aa)'posx <= currspd(aa) THEN
//                        currpos(aa)'posx := currpos(aa)'posx + currspd(aa)
//                    END
//                END
//            END
//            test := test + 1 ||
//            iter := ier + 1
//        INVARIANT
//            iter : NAT
//            & iter <= curr_aircrafts
//        VARIANT
//            curr_aircrafts - iter
//        END
//    END

END
