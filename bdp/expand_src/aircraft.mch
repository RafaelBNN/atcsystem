/* aircraft
 * Author: rbnn
 * Creation date: 26/08/22
 */
MACHINE
    aircraft

SEES

    topology , topology2d

SETS

    DIRECTION = { NN , SS , EE , WW }

CONCRETE_CONSTANTS

    AIRCRAFTID ,
    SOURCE ,
    DESTINATION ,
    SPEED_LIMIT ,
    ALTITUDE_LIMIT

PROPERTIES

    AIRCRAFTID : NAT
    & SPEED_LIMIT = 2
    & ALTITUDE_LIMIT : NAT
    & SOURCE : ZONE
    & DESTINATION : ZONE - { SOURCE }

ABSTRACT_VARIABLES

    current_zone , // currentPosition
    heading ,
    current_speed ,
    current_altitude

INVARIANT

    current_zone : ZONE
    & heading : DIRECTION
    & current_speed : NAT1
    & current_speed <= SPEED_LIMIT
    & current_altitude : NAT
    & current_altitude <= ALTITUDE_LIMIT
    & SOURCE /= DESTINATION

INITIALISATION

    current_zone := Z1
    || heading := NN
    || current_speed := 1
    || current_altitude := 0

OPERATIONS

    turnright =
    BEGIN
        IF heading = NN THEN
            heading := EE
        ELSIF heading = EE THEN
            heading := SS
        ELSIF heading = SS THEN
            heading := WW
        ELSIF heading = WW THEN
            heading := NN
        END
    END
    ;
    turnleft =
    BEGIN
        IF heading = NN THEN
            heading := WW
        ELSIF heading = WW THEN
            heading := SS
        ELSIF heading = SS THEN
            heading := EE
        ELSIF heading = EE THEN
            heading := NN
        END
    END
    ;
    speedup =
    PRE current_speed < 2 THEN
        BEGIN
            current_speed := current_speed + 1
        END
    END

END
