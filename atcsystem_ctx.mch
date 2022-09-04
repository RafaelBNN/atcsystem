MACHINE
    atcsystem_ctx
    
SETS
    
    DIRECTION = { NN, SS, EE, WW };
    STATE = {CLEAR, OCCUPIED}
    
//    AIRCRAFT
    
CONSTANTS
    
    capacity, // quantidade maxima de aeronaves no mapa em um dado momento
    
    mapw, maph, // altura e largura do mapa
    
    airport // conjunto com as localizacoes dos aeroportos
    
//    aircraft
    
//    aircraftid, 
//    speed_limit,
//    altitude_limit   
//    source,
//    destination,
    
PROPERTIES
    
//    total : NAT1
//    & capacity : NAT1
//    & capacity < total
//    & card(AIRCRAFT) = total

    capacity : NAT1
    
    & mapw = 3
    & maph = 3
    
    & airport <: struct(xx: (0..3), yy: (0..3))
        
//    TODO: essas coisas vao ter que virar funcoes de AIRCRAFT
//    pra alguma coisa (ou struct :think:)
    
//    & aircraftid : NAT
//    & speed_limit = 2
//    & altitude_limit : NAT
//    & source : struct(xx: (0..3), yy: (0..3))
//    & destination : struct(xx: (0..3), yy: (0..3)) - {source}

//    & aircraftid : AIRCRAFT --> NAT
//    & speed_limit : AIRCRAFT --> NAT1
//    & altitude_limit : AIRCRAFT --> NAT1
    
//    & source : AIRCRAFT --> airport
//    & destination : AIRCRAFT --> airport

//    & aircraft <: struct(
//        idd : NAT,
//        speed_limit : NAT1,
//        altitude_limit : NAT1,
//        source : airport,
//        destination : airport
//    )        
    
//INVARIANT
//    
//    ! aa . ( aa : aircraft => aa'source /= aa'destination)

END
