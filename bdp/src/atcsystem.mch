MACHINE
    atcsystem

SEES

    atcsystem_ctx

ABSTRACT_VARIABLES

    zone_states ,
    curr_aircrafts ,
    ids ,
    spdlmt ,
    altlmt ,
    currpos ,
    hdng ,
    currspd ,
    curralt

INVARIANT

    zone_states : mapa --> STATE

    // talvez seja dificil utilizar struct porque nas funcoes de speedup ou change_direction
    // fica complexo o modo de acessar uma aeronave especifica sem ter que passar
    // toda ela como argumento da funcao

    & ids : AIRCRAFT >+> NAT
    & spdlmt : AIRCRAFT +-> NAT1
    & altlmt : AIRCRAFT +-> NAT1
    & currpos : AIRCRAFT +-> struct ( posx : ( 0 .. 3 ) , posy : ( 0 .. 3 ) )
    & hdng : AIRCRAFT +-> DIRECTION
    & currspd : AIRCRAFT +-> NAT1
    & curralt : AIRCRAFT +-> NAT1

    & curr_aircrafts : NAT

    & card ( ids ) = curr_aircrafts
    & card ( spdlmt ) = curr_aircrafts
    & card ( altlmt ) = curr_aircrafts
    & card ( hdng ) = curr_aircrafts
    & card ( currspd ) = curr_aircrafts
    & card ( curralt ) = curr_aircrafts

INITIALISATION

    zone_states := {
        ( 0 , 0 ) |-> CLEAR , ( 0 , 1 ) |-> CLEAR , ( 0 , 2 ) |-> CLEAR , ( 0 , 3 ) |-> CLEAR ,
        ( 1 , 0 ) |-> CLEAR , ( 1 , 1 ) |-> CLEAR , ( 1 , 2 ) |-> CLEAR , ( 1 , 3 ) |-> CLEAR ,
        ( 2 , 0 ) |-> CLEAR , ( 2 , 1 ) |-> CLEAR , ( 2 , 2 ) |-> CLEAR , ( 2 , 3 ) |-> CLEAR ,
        ( 3 , 0 ) |-> CLEAR , ( 3 , 1 ) |-> CLEAR , ( 3 , 2 ) |-> CLEAR , ( 3 , 3 ) |-> CLEAR
    }
    || curr_aircrafts := 0
    || ids := {}
    || spdlmt := {}
    || altlmt := {}
    || currpos := {}
    || hdng := {}
    || currspd := {}
    || curralt := {}

OPERATIONS

    takeoff_from ( aa , pp ) =
    PRE
        aa : AIRCRAFT
        & pp : airport
        & zone_states ( pp ' xx , pp ' yy ) = CLEAR
        & curr_aircrafts < capacity
    THEN
        ids := ids \/ { aa |-> curr_aircrafts + 1 }
        || spdlmt := spdlmt \/ { aa |-> 1 }
        || altlmt := altlmt \/ { aa |-> 1 }
        || hdng := hdng \/ { aa |-> NN }
        || currspd := currspd \/ { aa |-> 3 }
        || curralt := curralt \/ { aa |-> 3 }
        || curr_aircrafts := curr_aircrafts + 1
        || zone_states ( pp ' xx , pp ' yy ) := OCCUPIED
    END ;

    change_direction ( ii , hh ) =
    PRE
        ii : ran ( ids )
        & hh : DIRECTION - { hdng ( ids ~ ( ii ) ) }
    THEN
        hdng ( ids ~ ( ii ) ) := hh
    END ;

    speedup ( ii ) =
    PRE
        ii : ran ( ids )
        & currspd ( ids ~ ( ii ) ) < ( spdlmt ( ids ~ ( ii ) ) )
    THEN
        currspd ( ids ~ ( ii ) ) := currspd ( ids ~ ( ii ) ) + 1
    END ;

    slowdown ( ii ) =
    PRE
        ii : ran ( ids )
        & currspd ( ids ~ ( ii ) ) < 1
    THEN
        currspd ( ids ~ ( ii ) ) := currspd ( ids ~ ( ii ) ) - 1
    END


END
