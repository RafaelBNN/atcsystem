MACHINE
    atcsystem_ctx

SETS

    DIRECTION = { NN , SS , EE , WW } ;
    STATE = { CLEAR , OCCUPIED } ;
    AIRCRAFT = { A1 , A2 , A3 , A4 }

CONCRETE_CONSTANTS

    total , // quantidade total de aeronaves
    capacity , // quantidade maxima de aeronaves no mapa em um dado momento
    mapw , maph // altura e largura do mapa

PROPERTIES

    total : NAT1
//    & capacity : NAT1
    & capacity = 3
    & capacity < total
    & card ( AIRCRAFT ) = total
    & mapw = 3
    & maph = 3

END
