MACHINE
    atcsystem

SEES

    atcsystem_ctx

ABSTRACT_VARIABLES

    zone_states ,

    // variaveis de aircraft
    // essas vamos ter que mudar pra arrays (ou structs)
    heading ,
    current_speed ,
    current_altitude

INVARIANT

    zone_states : ( 0 .. 3 --> ( 0 .. 3 --> STATE ) )

    & heading : DIRECTION
    & current_speed : NAT1
    & current_speed <= speed_limit
    & current_altitude : NAT
    & current_altitude <= altitude_limit
    & source /= destination

INITIALISATION

    heading := NN
    || current_speed := 1
    || current_altitude := 0
    || zone_states := { 0 |-> ( 0 .. 3 ) * { CLEAR } , 1 |-> ( 0 .. 3 ) * { CLEAR } , 2 |-> ( 0 .. 3 ) * { CLEAR } , 3 |-> ( 0 .. 3 ) * { CLEAR } }

END
