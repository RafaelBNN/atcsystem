Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(topology))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(topology))==(Machine(topology));
  Level(Machine(topology))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(topology)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(topology))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(topology))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(topology))==(?);
  List_Includes(Machine(topology))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(topology))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(topology))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(topology))==(?);
  Context_List_Variables(Machine(topology))==(?);
  Abstract_List_Variables(Machine(topology))==(?);
  Local_List_Variables(Machine(topology))==(zone_states);
  List_Variables(Machine(topology))==(zone_states);
  External_List_Variables(Machine(topology))==(zone_states)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(topology))==(?);
  Abstract_List_VisibleVariables(Machine(topology))==(?);
  External_List_VisibleVariables(Machine(topology))==(?);
  Expanded_List_VisibleVariables(Machine(topology))==(?);
  List_VisibleVariables(Machine(topology))==(?);
  Internal_List_VisibleVariables(Machine(topology))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(topology))==(btrue);
  Gluing_List_Invariant(Machine(topology))==(btrue);
  Expanded_List_Invariant(Machine(topology))==(btrue);
  Abstract_List_Invariant(Machine(topology))==(btrue);
  Context_List_Invariant(Machine(topology))==(btrue);
  List_Invariant(Machine(topology))==(zone_states: ZONE --> STATE)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(topology))==(btrue);
  Abstract_List_Assertions(Machine(topology))==(btrue);
  Context_List_Assertions(Machine(topology))==(btrue);
  List_Assertions(Machine(topology))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(topology))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(topology))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(topology))==(zone_states:=ZONE*{CLEAR});
  Context_List_Initialisation(Machine(topology))==(skip);
  List_Initialisation(Machine(topology))==(zone_states:=ZONE*{CLEAR})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(topology))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(topology))==(btrue);
  List_Constraints(Machine(topology))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(topology))==(?);
  List_Operations(Machine(topology))==(?)
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
  List_Valuable_Constants(Machine(topology))==(connection,airport);
  Inherited_List_Constants(Machine(topology))==(?);
  List_Constants(Machine(topology))==(connection,airport)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(topology),ZONE)==({Z1,Z2,Z3,Z4,Z5,Z6});
  Context_List_Enumerated(Machine(topology))==(?);
  Context_List_Defered(Machine(topology))==(?);
  Context_List_Sets(Machine(topology))==(?);
  List_Valuable_Sets(Machine(topology))==(?);
  Inherited_List_Enumerated(Machine(topology))==(?);
  Inherited_List_Defered(Machine(topology))==(?);
  Inherited_List_Sets(Machine(topology))==(?);
  List_Enumerated(Machine(topology))==(ZONE,STATE);
  List_Defered(Machine(topology))==(?);
  List_Sets(Machine(topology))==(ZONE,STATE);
  Set_Definition(Machine(topology),STATE)==({CLEAR,OCCUPIED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(topology))==(?);
  Expanded_List_HiddenConstants(Machine(topology))==(?);
  List_HiddenConstants(Machine(topology))==(?);
  External_List_HiddenConstants(Machine(topology))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(topology))==(btrue);
  Context_List_Properties(Machine(topology))==(btrue);
  Inherited_List_Properties(Machine(topology))==(btrue);
  List_Properties(Machine(topology))==(connection: ZONE <-> ZONE & airport: POW(ZONE) & !zz.(zz: ZONE => zz|->zz/:connection) & ZONE: FIN(INTEGER) & not(ZONE = {}) & STATE: FIN(INTEGER) & not(STATE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(topology)) == (connection,airport,ZONE,STATE,Z1,Z2,Z3,Z4,Z5,Z6,CLEAR,OCCUPIED | ? | zone_states | ? | ? | ? | ? | ? | topology);
  List_Of_HiddenCst_Ids(Machine(topology)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(topology)) == (connection,airport);
  List_Of_VisibleVar_Ids(Machine(topology)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(topology)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(topology)) == (Type(ZONE) == Cst(SetOf(etype(ZONE,0,5)));Type(STATE) == Cst(SetOf(etype(STATE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(topology)) == (Type(Z1) == Cst(etype(ZONE,0,5));Type(Z2) == Cst(etype(ZONE,0,5));Type(Z3) == Cst(etype(ZONE,0,5));Type(Z4) == Cst(etype(ZONE,0,5));Type(Z5) == Cst(etype(ZONE,0,5));Type(Z6) == Cst(etype(ZONE,0,5));Type(CLEAR) == Cst(etype(STATE,0,1));Type(OCCUPIED) == Cst(etype(STATE,0,1));Type(connection) == Cst(SetOf(etype(ZONE,?,?)*etype(ZONE,?,?)));Type(airport) == Cst(SetOf(etype(ZONE,"[airport","]airport"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(topology)) == (Type(zone_states) == Mvl(SetOf(etype(ZONE,0,5)*etype(STATE,0,1))))
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
