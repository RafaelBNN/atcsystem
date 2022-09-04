MACHINE
    atcsystem_ctx

SETS

    DIRECTION = { NN , SS , EE , WW } ;
    STATE = { CLEAR , OCCUPIED } ;

    AIRCRAFT

CONCRETE_CONSTANTS

    total ,

    capacity , // quantidade maxima de aeronaves no mapa em um dado momento

    mapw , maph , // altura e largura do mapa

    mapa ,

    airport // conjunto com as localizacoes dos aeroportos

//    aircraft

PROPERTIES

    total : NAT1
    & capacity : NAT1
    & capacity < total
    & card ( AIRCRAFT ) = total

//    capacity : NAT1

    & mapw = 3
    & maph = 3

//    & mapa = struct(xx : (0..mapw), yy : (0..maph))
    & mapa = ( 0 .. maph ) * ( 0 .. mapw )

//    & airport <: mapa

    & airport <: struct ( xx : ( 0 .. mapw ) , yy : ( 0 .. maph ) )

END
