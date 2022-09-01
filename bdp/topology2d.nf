Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(topology2d))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(topology2d))==(Machine(topology2d));
  Level(Machine(topology2d))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(topology2d)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(topology2d))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(topology2d))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(topology2d))==(?);
  List_Includes(Machine(topology2d))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(topology2d))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(topology2d))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(topology2d))==(?);
  Context_List_Variables(Machine(topology2d))==(?);
  Abstract_List_Variables(Machine(topology2d))==(?);
  Local_List_Variables(Machine(topology2d))==(teste_array,zone_states);
  List_Variables(Machine(topology2d))==(teste_array,zone_states);
  External_List_Variables(Machine(topology2d))==(teste_array,zone_states)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(topology2d))==(?);
  Abstract_List_VisibleVariables(Machine(topology2d))==(?);
  External_List_VisibleVariables(Machine(topology2d))==(?);
  Expanded_List_VisibleVariables(Machine(topology2d))==(?);
  List_VisibleVariables(Machine(topology2d))==(?);
  Internal_List_VisibleVariables(Machine(topology2d))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(topology2d))==(btrue);
  Gluing_List_Invariant(Machine(topology2d))==(btrue);
  Expanded_List_Invariant(Machine(topology2d))==(btrue);
  Abstract_List_Invariant(Machine(topology2d))==(btrue);
  Context_List_Invariant(Machine(topology2d))==(btrue);
  List_Invariant(Machine(topology2d))==(zone_states: 0..3 --> (0..3 --> STATE) & teste_array: 0..1 --> (0..1 --> STATE))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(topology2d))==(btrue);
  Abstract_List_Assertions(Machine(topology2d))==(btrue);
  Context_List_Assertions(Machine(topology2d))==(btrue);
  List_Assertions(Machine(topology2d))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(topology2d))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(topology2d))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(topology2d))==(zone_states,teste_array:={0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}},{0|->{0|->CLEAR,1|->CLEAR},1|->{0|->CLEAR,1|->CLEAR}});
  Context_List_Initialisation(Machine(topology2d))==(skip);
  List_Initialisation(Machine(topology2d))==(zone_states:={0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}} || teste_array:={0|->{0|->CLEAR,1|->CLEAR},1|->{0|->CLEAR,1|->CLEAR}})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(topology2d))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(topology2d))==(btrue);
  List_Constraints(Machine(topology2d))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(topology2d))==(?);
  List_Operations(Machine(topology2d))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(topology2d))==(mapw,maph);
  Inherited_List_Constants(Machine(topology2d))==(?);
  List_Constants(Machine(topology2d))==(mapw,maph)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(topology2d),STATE)==({CLEAR,OCCUPIED});
  Context_List_Enumerated(Machine(topology2d))==(?);
  Context_List_Defered(Machine(topology2d))==(?);
  Context_List_Sets(Machine(topology2d))==(?);
  List_Valuable_Sets(Machine(topology2d))==(?);
  Inherited_List_Enumerated(Machine(topology2d))==(?);
  Inherited_List_Defered(Machine(topology2d))==(?);
  Inherited_List_Sets(Machine(topology2d))==(?);
  List_Enumerated(Machine(topology2d))==(STATE);
  List_Defered(Machine(topology2d))==(?);
  List_Sets(Machine(topology2d))==(STATE)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(topology2d))==(?);
  Expanded_List_HiddenConstants(Machine(topology2d))==(?);
  List_HiddenConstants(Machine(topology2d))==(?);
  External_List_HiddenConstants(Machine(topology2d))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(topology2d))==(btrue);
  Context_List_Properties(Machine(topology2d))==(btrue);
  Inherited_List_Properties(Machine(topology2d))==(btrue);
  List_Properties(Machine(topology2d))==(mapw = 3 & maph = 3 & STATE: FIN(INTEGER) & not(STATE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(topology2d)) == (mapw,maph,STATE,CLEAR,OCCUPIED | ? | teste_array,zone_states | ? | ? | ? | ? | ? | topology2d);
  List_Of_HiddenCst_Ids(Machine(topology2d)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(topology2d)) == (mapw,maph);
  List_Of_VisibleVar_Ids(Machine(topology2d)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(topology2d)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(topology2d)) == (Type(STATE) == Cst(SetOf(etype(STATE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(topology2d)) == (Type(CLEAR) == Cst(etype(STATE,0,1));Type(OCCUPIED) == Cst(etype(STATE,0,1));Type(mapw) == Cst(btype(INTEGER,?,?));Type(maph) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(topology2d)) == (Type(teste_array) == Mvl(SetOf(btype(INTEGER,0,1)*SetOf(btype(INTEGER,0,1)*etype(STATE,0,1))));Type(zone_states) == Mvl(SetOf(btype(INTEGER,0,3)*SetOf(btype(INTEGER,0,3)*etype(STATE,0,1)))))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
