MACHINE
    atcsystem

SEES

    atcsystem_ctx

ABSTRACT_VARIABLES

    zone_states ,

    aircraft

INVARIANT

    zone_states : ( 0 .. 3 --> ( 0 .. 3 --> STATE ) )

//    zone_states : struct(xx : (0..mapw), yy : (0..maph)) --> STATE

    & aircraft <: struct (
        idd : NAT ,
        speed_limit : NAT1 ,
        altitude_limit : NAT1 ,
        heading : DIRECTION ,
        current_speed : NAT1 ,
        current_altitude : NAT1
//        current_zone : struct(xx : (0..mapw), yy : (0..maph))
    )

INITIALISATION

    zone_states := { 0 |-> ( 0 .. 3 ) * { CLEAR } , 1 |-> ( 0 .. 3 ) * { CLEAR } , 2 |-> ( 0 .. 3 ) * { CLEAR } , 3 |-> ( 0 .. 3 ) * { CLEAR } } // inicializando todas as zonas como CLEAR
//    zone_states := ! (ii, jj) . { 
//                    ii : (0..maph) & jj : (0..mapw) =>
//                    rec(xx : ii, yy : jj) |-> CLEAR
//                }

    || aircraft := {}

OPERATIONS

    takeofffrom ( aa ) =
    PRE
        aa : airport
        & zone_states ( aa ' xx ) ( aa ' yy ) = CLEAR
        & card ( aircraft ) < capacity
    THEN
        aircraft := aircraft \/
        { rec (
            idd : 0 ,
            speed_limit : 3 ,
            altitude_limit : 3 ,
            heading : NN ,
            current_speed : 1 ,
            current_altitude : 1
//            current_zone : rec(xx : aa'xx, yy : aa'yy)
        ) }
        || zone_states ( aa ' xx ) ( aa ' yy ) := OCCUPIED

    END



END
