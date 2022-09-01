Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(atcsystem))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(atcsystem))==(Machine(atcsystem));
  Level(Machine(atcsystem))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(atcsystem)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(atcsystem))==(atcsystem_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(atcsystem))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(atcsystem))==(?);
  List_Includes(Machine(atcsystem))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(atcsystem))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(atcsystem))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(atcsystem))==(?);
  Context_List_Variables(Machine(atcsystem))==(?);
  Abstract_List_Variables(Machine(atcsystem))==(?);
  Local_List_Variables(Machine(atcsystem))==(current_altitude,current_speed,heading,zone_states);
  List_Variables(Machine(atcsystem))==(current_altitude,current_speed,heading,zone_states);
  External_List_Variables(Machine(atcsystem))==(current_altitude,current_speed,heading,zone_states)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(atcsystem))==(?);
  Abstract_List_VisibleVariables(Machine(atcsystem))==(?);
  External_List_VisibleVariables(Machine(atcsystem))==(?);
  Expanded_List_VisibleVariables(Machine(atcsystem))==(?);
  List_VisibleVariables(Machine(atcsystem))==(?);
  Internal_List_VisibleVariables(Machine(atcsystem))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(atcsystem))==(btrue);
  Gluing_List_Invariant(Machine(atcsystem))==(btrue);
  Expanded_List_Invariant(Machine(atcsystem))==(btrue);
  Abstract_List_Invariant(Machine(atcsystem))==(btrue);
  Context_List_Invariant(Machine(atcsystem))==(source/=destination);
  List_Invariant(Machine(atcsystem))==(zone_states: 0..3 --> (0..3 --> STATE) & heading: DIRECTION & current_speed: NAT1 & current_speed<=speed_limit & current_altitude: NAT & current_altitude<=altitude_limit & source/=destination)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(atcsystem))==(btrue);
  Abstract_List_Assertions(Machine(atcsystem))==(btrue);
  Context_List_Assertions(Machine(atcsystem))==(btrue);
  List_Assertions(Machine(atcsystem))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(atcsystem))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(atcsystem))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(atcsystem))==(heading,current_speed,current_altitude,zone_states:=NN,1,0,{0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}});
  Context_List_Initialisation(Machine(atcsystem))==(skip);
  List_Initialisation(Machine(atcsystem))==(heading:=NN || current_speed:=1 || current_altitude:=0 || zone_states:={0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(atcsystem))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(atcsystem),Machine(atcsystem_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(atcsystem))==(btrue);
  List_Constraints(Machine(atcsystem))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(atcsystem))==(?);
  List_Operations(Machine(atcsystem))==(?)
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
  List_Valuable_Constants(Machine(atcsystem))==(?);
  Inherited_List_Constants(Machine(atcsystem))==(?);
  List_Constants(Machine(atcsystem))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(atcsystem),STATE)==({CLEAR,OCCUPIED});
  Context_List_Enumerated(Machine(atcsystem))==(DIRECTION,STATE);
  Context_List_Defered(Machine(atcsystem))==(AIRCRAFTS);
  Context_List_Sets(Machine(atcsystem))==(DIRECTION,STATE,AIRCRAFTS);
  List_Valuable_Sets(Machine(atcsystem))==(?);
  Inherited_List_Enumerated(Machine(atcsystem))==(?);
  Inherited_List_Defered(Machine(atcsystem))==(?);
  Inherited_List_Sets(Machine(atcsystem))==(?);
  List_Enumerated(Machine(atcsystem))==(?);
  List_Defered(Machine(atcsystem))==(?);
  List_Sets(Machine(atcsystem))==(?);
  Set_Definition(Machine(atcsystem),DIRECTION)==({NN,SS,EE,WW})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(atcsystem))==(?);
  Expanded_List_HiddenConstants(Machine(atcsystem))==(?);
  List_HiddenConstants(Machine(atcsystem))==(?);
  External_List_HiddenConstants(Machine(atcsystem))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(atcsystem))==(btrue);
  Context_List_Properties(Machine(atcsystem))==(mapw = 3 & maph = 3 & aircraftid: NAT & speed_limit = 2 & altitude_limit: NAT & source: struct(xx>>(0..3),yy>>(0..3)) & destination: struct(xx>>(0..3),yy>>(0..3))-{source} & AIRCRAFTS: FIN(INTEGER) & not(AIRCRAFTS = {}) & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}) & STATE: FIN(INTEGER) & not(STATE = {}));
  Inherited_List_Properties(Machine(atcsystem))==(btrue);
  List_Properties(Machine(atcsystem))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(atcsystem),Machine(atcsystem_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(atcsystem))==(?);
  Seen_Context_List_Invariant(Machine(atcsystem))==(btrue);
  Seen_Context_List_Assertions(Machine(atcsystem))==(btrue);
  Seen_Context_List_Properties(Machine(atcsystem))==(btrue);
  Seen_List_Constraints(Machine(atcsystem))==(btrue);
  Seen_List_Operations(Machine(atcsystem),Machine(atcsystem_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(atcsystem),Machine(atcsystem_ctx))==(btrue)
END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(atcsystem)) == (? | ? | current_altitude,current_speed,heading,zone_states | ? | ? | ? | seen(Machine(atcsystem_ctx)) | ? | atcsystem);
  List_Of_HiddenCst_Ids(Machine(atcsystem)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem)) == (?);
  List_Of_VisibleVar_Ids(Machine(atcsystem)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem)) == (?: ?);
  List_Of_Ids(Machine(atcsystem_ctx)) == (mapw,maph,aircraftid,source,destination,speed_limit,altitude_limit,DIRECTION,STATE,AIRCRAFTS,NN,SS,EE,WW,CLEAR,OCCUPIED | ? | ? | ? | ? | ? | ? | ? | atcsystem_ctx);
  List_Of_HiddenCst_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem_ctx)) == (mapw,maph,aircraftid,source,destination,speed_limit,altitude_limit);
  List_Of_VisibleVar_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(atcsystem)) == (Type(current_altitude) == Mvl(btype(INTEGER,?,?));Type(current_speed) == Mvl(btype(INTEGER,?,?));Type(heading) == Mvl(etype(DIRECTION,?,?));Type(zone_states) == Mvl(SetOf(btype(INTEGER,0,3)*SetOf(btype(INTEGER,0,3)*etype(STATE,0,1)))))
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
