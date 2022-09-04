Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(atcsystem2))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(atcsystem2))==(Machine(atcsystem2));
  Level(Machine(atcsystem2))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(atcsystem2)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(atcsystem2))==(atcsystem_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(atcsystem2))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(atcsystem2))==(?);
  List_Includes(Machine(atcsystem2))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(atcsystem2))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(atcsystem2))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(atcsystem2))==(?);
  Context_List_Variables(Machine(atcsystem2))==(?);
  Abstract_List_Variables(Machine(atcsystem2))==(?);
  Local_List_Variables(Machine(atcsystem2))==(curralt,currspd,hdng,altlmt,spdlmt,ids,aircraft,zone_states);
  List_Variables(Machine(atcsystem2))==(curralt,currspd,hdng,altlmt,spdlmt,ids,aircraft,zone_states);
  External_List_Variables(Machine(atcsystem2))==(curralt,currspd,hdng,altlmt,spdlmt,ids,aircraft,zone_states)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(atcsystem2))==(?);
  Abstract_List_VisibleVariables(Machine(atcsystem2))==(?);
  External_List_VisibleVariables(Machine(atcsystem2))==(?);
  Expanded_List_VisibleVariables(Machine(atcsystem2))==(?);
  List_VisibleVariables(Machine(atcsystem2))==(?);
  Internal_List_VisibleVariables(Machine(atcsystem2))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(atcsystem2))==(btrue);
  Gluing_List_Invariant(Machine(atcsystem2))==(btrue);
  Expanded_List_Invariant(Machine(atcsystem2))==(btrue);
  Abstract_List_Invariant(Machine(atcsystem2))==(btrue);
  Context_List_Invariant(Machine(atcsystem2))==(btrue);
  List_Invariant(Machine(atcsystem2))==(zone_states: 0..3 --> (0..3 --> STATE) & ids: AIRCRAFT +-> NAT & spdlmt: AIRCRAFT +-> NAT1 & altlmt: AIRCRAFT +-> NAT1 & hdng: AIRCRAFT +-> DIRECTION & currspd: AIRCRAFT +-> NAT1 & curralt: AIRCRAFT +-> NAT1 & aircraft <: struct(idd>>NAT,speed_limit>>NAT1,altitude_limit>>NAT1,heading>>DIRECTION,current_speed>>NAT1,current_altitude>>NAT1))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(atcsystem2))==(btrue);
  Abstract_List_Assertions(Machine(atcsystem2))==(btrue);
  Context_List_Assertions(Machine(atcsystem2))==(btrue);
  List_Assertions(Machine(atcsystem2))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(atcsystem2))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(atcsystem2))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(atcsystem2))==(zone_states,aircraft,ids,spdlmt,altlmt,hdng,currspd,curralt:={0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}},{},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(atcsystem2))==(skip);
  List_Initialisation(Machine(atcsystem2))==(zone_states:={0|->(0..3)*{CLEAR},1|->(0..3)*{CLEAR},2|->(0..3)*{CLEAR},3|->(0..3)*{CLEAR}} || aircraft:={} || ids:={} || spdlmt:={} || altlmt:={} || hdng:={} || currspd:={} || curralt:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(atcsystem2))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(atcsystem2),Machine(atcsystem_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(atcsystem2))==(btrue);
  List_Constraints(Machine(atcsystem2))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(atcsystem2))==(takeoff_from);
  List_Operations(Machine(atcsystem2))==(takeoff_from)
END
&
THEORY ListInputX IS
  List_Input(Machine(atcsystem2),takeoff_from)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(atcsystem2),takeoff_from)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(atcsystem2),takeoff_from)==(takeoff_from(pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(atcsystem2),takeoff_from)==(pp: airport & zone_states(pp'xx)(pp'yy) = CLEAR & card(aircraft)<capacity)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(atcsystem2),takeoff_from)==(pp: airport & zone_states(pp'xx)(pp'yy) = CLEAR & card(aircraft)<capacity | aircraft,zone_states:=aircraft\/{rec(idd>>0,speed_limit>>3,altitude_limit>>3,heading>>NN,current_speed>>1,current_altitude>>1)},zone_states<+{pp'xx|->(zone_states(pp'xx)<+{pp'yy|->OCCUPIED})});
  List_Substitution(Machine(atcsystem2),takeoff_from)==(aircraft:=aircraft\/{rec(idd>>0,speed_limit>>3,altitude_limit>>3,heading>>NN,current_speed>>1,current_altitude>>1)} || zone_states(pp'xx)(pp'yy):=OCCUPIED)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(atcsystem2))==(?);
  Inherited_List_Constants(Machine(atcsystem2))==(?);
  List_Constants(Machine(atcsystem2))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(atcsystem2),STATE)==({CLEAR,OCCUPIED});
  Context_List_Enumerated(Machine(atcsystem2))==(DIRECTION,STATE);
  Context_List_Defered(Machine(atcsystem2))==(AIRCRAFT);
  Context_List_Sets(Machine(atcsystem2))==(DIRECTION,STATE,AIRCRAFT);
  List_Valuable_Sets(Machine(atcsystem2))==(?);
  Inherited_List_Enumerated(Machine(atcsystem2))==(?);
  Inherited_List_Defered(Machine(atcsystem2))==(?);
  Inherited_List_Sets(Machine(atcsystem2))==(?);
  List_Enumerated(Machine(atcsystem2))==(?);
  List_Defered(Machine(atcsystem2))==(?);
  List_Sets(Machine(atcsystem2))==(?);
  Set_Definition(Machine(atcsystem2),DIRECTION)==({NN,SS,EE,WW})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(atcsystem2))==(?);
  Expanded_List_HiddenConstants(Machine(atcsystem2))==(?);
  List_HiddenConstants(Machine(atcsystem2))==(?);
  External_List_HiddenConstants(Machine(atcsystem2))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(atcsystem2))==(btrue);
  Context_List_Properties(Machine(atcsystem2))==(capacity: NAT1 & mapw = 3 & maph = 3 & airport <: struct(xx>>(0..3),yy>>(0..3)) & AIRCRAFT: FIN(INTEGER) & not(AIRCRAFT = {}) & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}) & STATE: FIN(INTEGER) & not(STATE = {}));
  Inherited_List_Properties(Machine(atcsystem2))==(btrue);
  List_Properties(Machine(atcsystem2))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(atcsystem2),Machine(atcsystem_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(atcsystem2))==(?);
  Seen_Context_List_Invariant(Machine(atcsystem2))==(btrue);
  Seen_Context_List_Assertions(Machine(atcsystem2))==(btrue);
  Seen_Context_List_Properties(Machine(atcsystem2))==(btrue);
  Seen_List_Constraints(Machine(atcsystem2))==(btrue);
  Seen_List_Operations(Machine(atcsystem2),Machine(atcsystem_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(atcsystem2),Machine(atcsystem_ctx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(atcsystem2),takeoff_from)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(atcsystem2)) == (? | ? | curralt,currspd,hdng,altlmt,spdlmt,ids,aircraft,zone_states | ? | takeoff_from | ? | seen(Machine(atcsystem_ctx)) | ? | atcsystem2);
  List_Of_HiddenCst_Ids(Machine(atcsystem2)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem2)) == (?);
  List_Of_VisibleVar_Ids(Machine(atcsystem2)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem2)) == (?: ?);
  List_Of_Ids(Machine(atcsystem_ctx)) == (capacity,mapw,maph,airport,DIRECTION,STATE,AIRCRAFT,NN,SS,EE,WW,CLEAR,OCCUPIED | ? | ? | ? | ? | ? | ? | ? | atcsystem_ctx);
  List_Of_HiddenCst_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem_ctx)) == (capacity,mapw,maph,airport);
  List_Of_VisibleVar_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(atcsystem2)) == (Type(curralt) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(currspd) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(hdng) == Mvl(SetOf(atype(AIRCRAFT,?,?)*etype(DIRECTION,?,?)));Type(altlmt) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(spdlmt) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(ids) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(aircraft) == Mvl(SetOf(rtype((((((idd: btype(INTEGER,0,MAXINT)),speed_limit: btype(INTEGER,1,MAXINT)),altitude_limit: btype(INTEGER,1,MAXINT)),heading: etype(DIRECTION,0,3)),current_speed: btype(INTEGER,1,MAXINT)),current_altitude: btype(INTEGER,1,MAXINT))));Type(zone_states) == Mvl(SetOf(btype(INTEGER,0,3)*SetOf(btype(INTEGER,0,3)*etype(STATE,0,1)))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(atcsystem2)) == (Type(takeoff_from) == Cst(No_type,rtype((xx: btype(INTEGER,0,3)),yy: btype(INTEGER,0,3))))
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
