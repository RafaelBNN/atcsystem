/* statictopology
 * Author: rbnn
 * Creation date: 22/08/22
 */
MACHINE
    topology
    
SETS
    
    ZONE = {Z1, Z2, Z3, Z4, Z5, Z6}; // ZONE eh o conjunto que contem as zonas mostradas no grafo do artigo.
                                    // Caso o caminho a ser tomado seja o plano 2d, parece ser mais interessante
                                    // que tenhamos uma matriz (array bidimensional) para representar o mapa
    STATE = {CLEAR, OCCUPIED}    // STATE eh um conjunto auxiliar para a variavel state, que indica, para cada zona:ZONE,
                                // se aquela zona esta ocupada por uma aeronave ou nao

//    CONNECTION = { Z1 |-> Z2, Z2 |-> Z3, Z3 |-> Z5, Z5 |-> Z4, Z4 |-> Z3, Z2 |-> Z5, Z2 |-> Z6, Z1 |-> Z6, Z6 |-> Z5, Z6 |-> Z2 }; // CONNECTION eh o conjunto que delimita as arestas entre os nos do grafo. Se, por exemplo, existe uma aresta Z1|->Z2, entao uma aeronave que esteja em Z1 pode se movimentar para Z2.
//    AIRPORT = { Z5, Z6 } // AIRPORT eh uma funcao total injetiva de RUNWAY para ZONE. Para simplificar, podemos modelar essa variavel como um subconjunto de ZONE. Se uma aeronave estiver em uma zona z:AIRPORT, essa aeronave "some" do mapa, simulando um aviao que pousou.

CONSTANTS
    
    connection,
    airport
    
PROPERTIES
    
    //connection : POW(ZONE * ZONE)
    connection : ZONE <-> ZONE
    & airport : POW(ZONE)
    & ! zz . ( zz : ZONE => zz |-> zz /: connection)
    
VARIABLES
    
    zone_states
    
INVARIANT
    
    zone_states : ZONE --> STATE // toda zona tem um estado 
    
INITIALISATION
    
    zone_states := ZONE * { CLEAR }

END
