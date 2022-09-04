MACHINE
    atcsystem2
    
SEES
    
    atcsystem_ctx
    
VARIABLES
    
    zone_states,
    aircraft,
    
    ids,
    spdlmt,
    altlmt,
    hdng,
    currspd,
    curralt
    
INVARIANT
    
    zone_states = (((0..3)*(0..3)) +-> STATE)
    
    // colocando como funcoes parciais inicialmente porque talvez aeronaves que
    // nao estejam no mapa naquele momento nao tenham aquele atributo
    & ids : AIRCRAFT +-> NAT
    & spdlmt : AIRCRAFT +-> NAT1
    & altlmt : AIRCRAFT +-> NAT1
    & hdng : AIRCRAFT +-> DIRECTION
    & currspd : AIRCRAFT +-> NAT1
    & curralt : AIRCRAFT +-> NAT1
    
    // para todo spdlmt e currspd, vamos ter que fazer a relacao

    
INITIALISATION
    
//    zone_states := {0|->(0..3)*{CLEAR}, 1|->(0..3)*{CLEAR}, 2|->(0..3)*{CLEAR}, 3|->(0..3)*{CLEAR}}
    zone_states := {(0,0) |-> CLEAR}
    || aircraft := {}
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
        & pp'xx : dom(zone_states)
        & pp'yy: dom(zone_states(pp'xx)) 
        & zone_states(pp'xx)(pp'yy) = CLEAR
        & card(aircraft) < capacity
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
        || zone_states(pp'xx)(pp'yy) := OCCUPIED
    
    END

END
