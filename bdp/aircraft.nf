Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(aircraft))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(aircraft))==(Machine(aircraft));
  Level(Machine(aircraft))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(aircraft)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(aircraft))==(topology)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(aircraft))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(aircraft))==(?);
  List_Includes(Machine(aircraft))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(aircraft))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(aircraft))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(aircraft))==(?);
  Context_List_Variables(Machine(aircraft))==(?);
  Abstract_List_Variables(Machine(aircraft))==(?);
  Local_List_Variables(Machine(aircraft))==(current_altitude,current_speed,heading,current_zone);
  List_Variables(Machine(aircraft))==(current_altitude,current_speed,heading,current_zone);
  External_List_Variables(Machine(aircraft))==(current_altitude,current_speed,heading,current_zone)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(aircraft))==(?);
  Abstract_List_VisibleVariables(Machine(aircraft))==(?);
  External_List_VisibleVariables(Machine(aircraft))==(?);
  Expanded_List_VisibleVariables(Machine(aircraft))==(?);
  List_VisibleVariables(Machine(aircraft))==(?);
  Internal_List_VisibleVariables(Machine(aircraft))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(aircraft))==(btrue);
  Gluing_List_Invariant(Machine(aircraft))==(btrue);
  Expanded_List_Invariant(Machine(aircraft))==(btrue);
  Abstract_List_Invariant(Machine(aircraft))==(btrue);
  Context_List_Invariant(Machine(aircraft))==(zone_states: ZONE --> STATE);
  List_Invariant(Machine(aircraft))==(current_zone: ZONE & heading: DIRECTION & current_speed: NAT1 & current_speed<=SPEED_LIMIT & current_altitude: NAT & current_altitude<=ALTITUDE_LIMIT & SOURCE/=DESTINATION)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(aircraft))==(btrue);
  Abstract_List_Assertions(Machine(aircraft))==(btrue);
  Context_List_Assertions(Machine(aircraft))==(btrue);
  List_Assertions(Machine(aircraft))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(aircraft))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(aircraft))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(aircraft))==(current_zone,heading,current_speed,current_altitude:=Z1,NN,1,0);
  Context_List_Initialisation(Machine(aircraft))==(skip);
  List_Initialisation(Machine(aircraft))==(current_zone:=Z1 || heading:=NN || current_speed:=1 || current_altitude:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(aircraft))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(aircraft),Machine(topology))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(aircraft))==(btrue);
  List_Constraints(Machine(aircraft))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(aircraft))==(turnright,turnleft,speedup);
  List_Operations(Machine(aircraft))==(turnright,turnleft,speedup)
END
&
THEORY ListInputX IS
  List_Input(Machine(aircraft),turnright)==(?);
  List_Input(Machine(aircraft),turnleft)==(?);
  List_Input(Machine(aircraft),speedup)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(aircraft),turnright)==(?);
  List_Output(Machine(aircraft),turnleft)==(?);
  List_Output(Machine(aircraft),speedup)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(aircraft),turnright)==(turnright);
  List_Header(Machine(aircraft),turnleft)==(turnleft);
  List_Header(Machine(aircraft),speedup)==(speedup)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(aircraft),turnright)==(btrue);
  List_Precondition(Machine(aircraft),turnleft)==(btrue);
  List_Precondition(Machine(aircraft),speedup)==(current_speed<2)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(aircraft),speedup)==(current_speed<2 | current_speed:=current_speed+1);
  Expanded_List_Substitution(Machine(aircraft),turnleft)==(btrue | heading = NN ==> heading:=WW [] not(heading = NN) ==> (heading = WW ==> heading:=SS [] not(heading = WW) ==> (heading = SS ==> heading:=EE [] not(heading = SS) ==> (heading = EE ==> heading:=NN [] not(heading = EE) ==> skip))));
  Expanded_List_Substitution(Machine(aircraft),turnright)==(btrue | heading = NN ==> heading:=EE [] not(heading = NN) ==> (heading = EE ==> heading:=SS [] not(heading = EE) ==> (heading = SS ==> heading:=WW [] not(heading = SS) ==> (heading = WW ==> heading:=NN [] not(heading = WW) ==> skip))));
  List_Substitution(Machine(aircraft),turnright)==(IF heading = NN THEN heading:=EE ELSIF heading = EE THEN heading:=SS ELSIF heading = SS THEN heading:=WW ELSIF heading = WW THEN heading:=NN END);
  List_Substitution(Machine(aircraft),turnleft)==(IF heading = NN THEN heading:=WW ELSIF heading = WW THEN heading:=SS ELSIF heading = SS THEN heading:=EE ELSIF heading = EE THEN heading:=NN END);
  List_Substitution(Machine(aircraft),speedup)==(BEGIN current_speed:=current_speed+1 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(aircraft))==(AIRCRAFTID,SOURCE,DESTINATION,SPEED_LIMIT,ALTITUDE_LIMIT);
  Inherited_List_Constants(Machine(aircraft))==(?);
  List_Constants(Machine(aircraft))==(AIRCRAFTID,SOURCE,DESTINATION,SPEED_LIMIT,ALTITUDE_LIMIT)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(aircraft),STATE)==({CLEAR,OCCUPIED});
  Context_List_Enumerated(Machine(aircraft))==(ZONE,STATE);
  Context_List_Defered(Machine(aircraft))==(?);
  Context_List_Sets(Machine(aircraft))==(ZONE,STATE);
  List_Valuable_Sets(Machine(aircraft))==(?);
  Inherited_List_Enumerated(Machine(aircraft))==(?);
  Inherited_List_Defered(Machine(aircraft))==(?);
  Inherited_List_Sets(Machine(aircraft))==(?);
  List_Enumerated(Machine(aircraft))==(DIRECTION);
  List_Defered(Machine(aircraft))==(?);
  List_Sets(Machine(aircraft))==(DIRECTION);
  Set_Definition(Machine(aircraft),ZONE)==({Z1,Z2,Z3,Z4,Z5,Z6});
  Set_Definition(Machine(aircraft),DIRECTION)==({NN,SS,EE,WW})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(aircraft))==(?);
  Expanded_List_HiddenConstants(Machine(aircraft))==(?);
  List_HiddenConstants(Machine(aircraft))==(?);
  External_List_HiddenConstants(Machine(aircraft))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(aircraft))==(btrue);
  Context_List_Properties(Machine(aircraft))==(connection: ZONE <-> ZONE & airport: POW(ZONE) & !zz.(zz: ZONE => zz|->zz/:connection) & ZONE: FIN(INTEGER) & not(ZONE = {}) & STATE: FIN(INTEGER) & not(STATE = {}));
  Inherited_List_Properties(Machine(aircraft))==(btrue);
  List_Properties(Machine(aircraft))==(AIRCRAFTID: NAT & SPEED_LIMIT = 2 & ALTITUDE_LIMIT: NAT & SOURCE: ZONE & DESTINATION: ZONE-{SOURCE} & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(aircraft),Machine(topology))==(?);
  Seen_Context_List_Enumerated(Machine(aircraft))==(?);
  Seen_Context_List_Invariant(Machine(aircraft))==(btrue);
  Seen_Context_List_Assertions(Machine(aircraft))==(btrue);
  Seen_Context_List_Properties(Machine(aircraft))==(btrue);
  Seen_List_Constraints(Machine(aircraft))==(btrue);
  Seen_List_Operations(Machine(aircraft),Machine(topology))==(?);
  Seen_Expanded_List_Invariant(Machine(aircraft),Machine(topology))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(aircraft),turnright)==(?);
  List_ANY_Var(Machine(aircraft),turnleft)==(?);
  List_ANY_Var(Machine(aircraft),speedup)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(aircraft)) == (AIRCRAFTID,SOURCE,DESTINATION,SPEED_LIMIT,ALTITUDE_LIMIT,DIRECTION,NN,SS,EE,WW | ? | current_altitude,current_speed,heading,current_zone | ? | turnright,turnleft,speedup | ? | seen(Machine(topology)) | ? | aircraft);
  List_Of_HiddenCst_Ids(Machine(aircraft)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(aircraft)) == (AIRCRAFTID,SOURCE,DESTINATION,SPEED_LIMIT,ALTITUDE_LIMIT);
  List_Of_VisibleVar_Ids(Machine(aircraft)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(aircraft)) == (?: ?);
  List_Of_Ids(Machine(topology)) == (connection,airport,ZONE,STATE,Z1,Z2,Z3,Z4,Z5,Z6,CLEAR,OCCUPIED | ? | zone_states | ? | ? | ? | ? | ? | topology);
  List_Of_HiddenCst_Ids(Machine(topology)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(topology)) == (connection,airport);
  List_Of_VisibleVar_Ids(Machine(topology)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(topology)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(aircraft)) == (Type(DIRECTION) == Cst(SetOf(etype(DIRECTION,0,3))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(aircraft)) == (Type(NN) == Cst(etype(DIRECTION,0,3));Type(SS) == Cst(etype(DIRECTION,0,3));Type(EE) == Cst(etype(DIRECTION,0,3));Type(WW) == Cst(etype(DIRECTION,0,3));Type(AIRCRAFTID) == Cst(btype(INTEGER,?,?));Type(SOURCE) == Cst(etype(ZONE,?,?));Type(DESTINATION) == Cst(etype(ZONE,?,?));Type(SPEED_LIMIT) == Cst(btype(INTEGER,?,?));Type(ALTITUDE_LIMIT) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(aircraft)) == (Type(current_altitude) == Mvl(btype(INTEGER,?,?));Type(current_speed) == Mvl(btype(INTEGER,?,?));Type(heading) == Mvl(etype(DIRECTION,?,?));Type(current_zone) == Mvl(etype(ZONE,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(aircraft)) == (Type(speedup) == Cst(No_type,No_type);Type(turnleft) == Cst(No_type,No_type);Type(turnright) == Cst(No_type,No_type))
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
