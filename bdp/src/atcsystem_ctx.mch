MACHINE
    atcsystem_ctx

SETS

    DIRECTION = { NN , SS , EE , WW } ;
    STATE = { CLEAR , OCCUPIED } ;

    AIRCRAFTS

CONCRETE_CONSTANTS

    mapw , maph ,

    // TODO: essas coisas vao ter que virar funcoes de AIRCRAFT
    // pra alguma coisa (ou struct :think:)

    aircraftid ,
    source ,
    destination ,
    speed_limit ,
    altitude_limit

PROPERTIES

    mapw = 3
    & maph = 3
    & aircraftid : NAT
    & speed_limit = 2
    & altitude_limit : NAT
    & source : struct ( xx : ( 0 .. 3 ) , yy : ( 0 .. 3 ) )
    & destination : struct ( xx : ( 0 .. 3 ) , yy : ( 0 .. 3 ) ) - { source }

INVARIANT

    source /= destination

END
