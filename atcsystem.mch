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
    hdng,
    currspd,
    curralt
    
INVARIANT
    
    zone_states : mapa --> STATE
    
    // talvez seja dificil utilizar struct porque nas funcoes de speedup ou change_direction
    // fica complexo o modo de acessar uma aeronave especifica sem ter que passar
    // toda ela como argumento da funcao
    
    & ids : AIRCRAFT +-> NAT
    & spdlmt : AIRCRAFT +-> NAT1
    & altlmt : AIRCRAFT +-> NAT1
    & hdng : AIRCRAFT +-> DIRECTION
    & currspd : AIRCRAFT +-> NAT1
    & curralt : AIRCRAFT +-> NAT1
    & curr_aircrafts : NAT
    
INITIALISATION
    
//    zone_states := {0|->(0..3)*{CLEAR}, 1|->(0..3)*{CLEAR}, 2|->(0..3)*{CLEAR}, 3|->(0..3)*{CLEAR}}
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
    || hdng := {}
    || currspd := {}
    || curralt := {}
    
OPERATIONS
    
    takeoff_from(pp) =
    PRE
        pp : airport
        & zone_states(pp'xx, pp'yy) = CLEAR
        & cur_aircrafts < capacity
    THEN
        aircraft := aircraft \/
        {rec(
            idd : 0,
            speed_limit : 3,
            altitude_limit : 3,
            heading : NN,
            current_speed : 1,
            current_altitude : 1
        )}
        || zone_states(pp'xx, pp'yy) := OCCUPIED
    END;
    
    change_direction(aa, hh) =
    PRE
        aa : aircraft
        & hh : DIRECTION - {aa'heading}
    THEN
        aa'heading := hh
    END;
    
    speedup(aa) =
    PRE
        aa : aircraft
        & aa'current_speed < aa'speed_limit
    THEN
        aa'current_speed := aa'current_speed + 1
    END;
    
    slowdown(aa) =
    PRE
        aa : aircraft
        & aa'current_speed < 1
    THEN
        aa'current_speed := aa'current_speed - 1
    END

END
