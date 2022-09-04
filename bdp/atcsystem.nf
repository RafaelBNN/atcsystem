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
  Local_List_Variables(Machine(atcsystem))==(aircraft,zone_states);
  List_Variables(Machine(atcsystem))==(aircraft,zone_states);
  External_List_Variables(Machine(atcsystem))==(aircraft,zone_states)
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
  Context_List_Invariant(Machine(atcsystem))==(btrue);
  List_Invariant(Machine(atcsystem))==(zone_states: 0..3 --> (0..3 --> STATE) & aircraft <: struct(idd>>NAT,speed_limit>>NAT1,altitude_limit>>NAT1,heading>>DIRECTION,current_speed>>NAT1,current_altitude>>NAT1))
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
  Expanded_List_Initialisation(Machine(atcsystem))==(zone_states,aircraft:={0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}},{});
  Context_List_Initialisation(Machine(atcsystem))==(skip);
  List_Initialisation(Machine(atcsystem))==(zone_states:={0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}} || aircraft:={})
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
  Internal_List_Operations(Machine(atcsystem))==(takeoff_from);
  List_Operations(Machine(atcsystem))==(takeoff_from)
END
&
THEORY ListInputX IS
  List_Input(Machine(atcsystem),takeoff_from)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(atcsystem),takeoff_from)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(atcsystem),takeoff_from)==(takeoff_from(pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(atcsystem),takeoff_from)==(pp: airport & zone_states(pp'xx)(pp'yy) = CLEAR & card(aircraft)<capacity)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(atcsystem),takeoff_from)==(pp: airport & zone_states(pp'xx)(pp'yy) = CLEAR & card(aircraft)<capacity | aircraft,zone_states:=aircraft\/{rec(idd>>0,speed_limit>>3,altitude_limit>>3,heading>>NN,current_speed>>1,current_altitude>>1)},zone_states<+{pp'xx|->(zone_states(pp'xx)<+{pp'yy|->OCCUPIED})});
  List_Substitution(Machine(atcsystem),takeoff_from)==(aircraft:=aircraft\/{rec(idd>>0,speed_limit>>3,altitude_limit>>3,heading>>NN,current_speed>>1,current_altitude>>1)} || zone_states(pp'xx)(pp'yy):=OCCUPIED)
END
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
  Context_List_Defered(Machine(atcsystem))==(?);
  Context_List_Sets(Machine(atcsystem))==(DIRECTION,STATE);
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
  Context_List_Properties(Machine(atcsystem))==(capacity: NAT1 & mapw = 3 & maph = 3 & airport <: struct(xx>>(0..3),yy>>(0..3)) & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}) & STATE: FIN(INTEGER) & not(STATE = {}));
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
THEORY ListANYVarX IS
  List_ANY_Var(Machine(atcsystem),takeoff_from)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(atcsystem)) == (? | ? | aircraft,zone_states | ? | takeoff_from | ? | seen(Machine(atcsystem_ctx)) | ? | atcsystem);
  List_Of_HiddenCst_Ids(Machine(atcsystem)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem)) == (?);
  List_Of_VisibleVar_Ids(Machine(atcsystem)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem)) == (?: ?);
  List_Of_Ids(Machine(atcsystem_ctx)) == (capacity,mapw,maph,airport,DIRECTION,STATE,NN,SS,EE,WW,CLEAR,OCCUPIED | ? | ? | ? | ? | ? | ? | ? | atcsystem_ctx);
  List_Of_HiddenCst_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem_ctx)) == (capacity,mapw,maph,airport);
  List_Of_VisibleVar_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(atcsystem)) == (Type(aircraft) == Mvl(SetOf(rtype((((((idd: btype(INTEGER,0,MAXINT)),speed_limit: btype(INTEGER,1,MAXINT)),altitude_limit: btype(INTEGER,1,MAXINT)),heading: etype(DIRECTION,0,3)),current_speed: btype(INTEGER,1,MAXINT)),current_altitude: btype(INTEGER,1,MAXINT))));Type(zone_states) == Mvl(SetOf(btype(INTEGER,0,3)*SetOf(btype(INTEGER,0,3)*etype(STATE,0,1)))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(atcsystem)) == (Type(takeoff_from) == Cst(No_type,rtype((xx: btype(INTEGER,0,3)),yy: btype(INTEGER,0,3))))
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
