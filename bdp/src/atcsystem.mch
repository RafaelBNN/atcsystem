MACHINE
    atcsystem

SEES

    atcsystem_ctx

ABSTRACT_VARIABLES

    zone_states ,

    aircraft

INVARIANT

    zone_states : mapa --> STATE

//    zone_states : (0..3 --> (0..3 --> STATE))

//    zone_states : struct(xx : (0..mapw), yy : (0..maph)) --> STATE

    & aircraft <: struct (
        idd : NAT ,
        speed_limit : NAT1 ,
        altitude_limit : NAT1 ,
        heading : DIRECTION ,
        current_speed : NAT1 ,
        current_altitude : NAT1

    )

INITIALISATION

    zone_states := {
        rec ( xx : 0 , yy : 0 ) |-> CLEAR ,
        rec ( xx : 0 , yy : 1 ) |-> CLEAR ,
        rec ( xx : 0 , yy : 2 ) |-> CLEAR ,
        rec ( xx : 0 , yy : 3 ) |-> CLEAR ,
        rec ( xx : 1 , yy : 0 ) |-> CLEAR ,
        rec ( xx : 1 , yy : 1 ) |-> CLEAR ,
        rec ( xx : 1 , yy : 2 ) |-> CLEAR ,
        rec ( xx : 1 , yy : 3 ) |-> CLEAR ,
        rec ( xx : 2 , yy : 0 ) |-> CLEAR ,
        rec ( xx : 2 , yy : 1 ) |-> CLEAR ,
        rec ( xx : 2 , yy : 2 ) |-> CLEAR ,
        rec ( xx : 2 , yy : 3 ) |-> CLEAR ,
        rec ( xx : 3 , yy : 0 ) |-> CLEAR ,
        rec ( xx : 3 , yy : 1 ) |-> CLEAR ,
        rec ( xx : 3 , yy : 2 ) |-> CLEAR ,
        rec ( xx : 3 , yy : 3 ) |-> CLEAR
        }

//    zone_states := {0|->(0..3)*{CLEAR}, 1|->(0..3)*{CLEAR}, 2|->(0..3)*{CLEAR}, 3|->(0..3)*{CLEAR}} // inicializando todas as zonas como CLEAR
//    zone_states := ! (ii, jj) . { 
//                    ii : (0..maph) & jj : (0..mapw) =>
//                    rec(xx : ii, yy : jj) |-> CLEAR
//                }

    || aircraft := {}

OPERATIONS

    takeoff_from ( pp ) =
    PRE
        pp : airport
        & zone_states ( rec ( xx : pp ' xx , yy : pp ' yy ) ) = CLEAR
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

        ) }
        || zone_states ( rec ( xx : pp ' xx , yy : pp ' yy ) ) := OCCUPIED

    END

END
