MACHINE
    topology2d
    
SETS
    
    STATE = {CLEAR, OCCUPIED}
    
CONSTANTS
    
    mapw, maph
//    map2d
    
PROPERTIES
    
//    map2d = (0..8)*(0..8) // map2d = {(0,0), (0,1), (0,2), ... (0,7), (1,0), (1,1), ..., (7,7)}
//    & map2d = struct(xx:(0..1), yy:(0..1))
    mapw = 3 & maph = 3

    
VARIABLES
    
    zone_states,
    teste_array
    
INVARIANT
    
    zone_states : (0..3 --> (0..3 --> STATE))
    & teste_array : (0..1 --> (0..1 --> STATE))
    
INITIALISATION
    
//    zone_states := ((0..8)*(0..8))*{CLEAR}
//    zone_states := {rec(xx:0,yy:0)|->CLEAR, rec(xx:0,yy:1)|->CLEAR, rec(xx:1,yy:0)|->CLEAR, rec(xx:1,yy:1)|->CLEAR}
//    zone_states(0) := ((0..mapw)*{CLEAR})
//    || zone_states(1) := ((0..mapw)*{CLEAR})
//    || zone_states(2) := ((0..mapw)*{CLEAR})
//    || zone_states(3) := ((0..mapw)*{CLEAR})
    zone_states := {0|->(0..3)*{CLEAR}, 1|->(0..3)*{CLEAR}, 2|->(0..3)*{CLEAR}, 3|->(0..3)*{CLEAR}}
    || teste_array := {0|->{0|->CLEAR, 1|-> CLEAR}, 1|->{0|->CLEAR, 1|->CLEAR}}

END
