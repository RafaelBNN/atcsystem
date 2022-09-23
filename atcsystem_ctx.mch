MACHINE
    atcsystem_ctx
    
SETS
    
    DIRECTION = {NN, SS, EE, WW};
//    STATE = {CLEAR, OCCUPIED};
    AIRCRAFT = {A1, A2, A3, A4}
    
CONSTANTS
    
    total, // quantidade total de aeronaves
    capacity, // quantidade maxima de aeronaves no mapa em um dado momento
    mapw, maph, // altura e largura do mapa
    map, airport
    
PROPERTIES
    
    total : NAT1
    & capacity : NAT1
    & capacity = 3
    & capacity < total
    & card(AIRCRAFT) = total
    & mapw = 3
    & maph = 3
    & map = struct(xx : (0..mapw), yy : (0..maph))
    & airport <: map

END
