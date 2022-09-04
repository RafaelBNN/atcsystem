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
  Local_List_Variables(Machine(atcsystem))==(curralt,currspd,hdng,currpos,altlmt,spdlmt,ids,curr_aircrafts,zone_states);
  List_Variables(Machine(atcsystem))==(curralt,currspd,hdng,currpos,altlmt,spdlmt,ids,curr_aircrafts,zone_states);
  External_List_Variables(Machine(atcsystem))==(curralt,currspd,hdng,currpos,altlmt,spdlmt,ids,curr_aircrafts,zone_states)
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
  List_Invariant(Machine(atcsystem))==(zone_states: mapa --> STATE & ids: AIRCRAFT >+> NAT & spdlmt: AIRCRAFT +-> NAT1 & altlmt: AIRCRAFT +-> NAT1 & currpos: AIRCRAFT +-> struct(posx>>(0..3),posy>>(0..3)) & hdng: AIRCRAFT +-> DIRECTION & currspd: AIRCRAFT +-> NAT1 & curralt: AIRCRAFT +-> NAT1 & curr_aircrafts: NAT & card(ids) = curr_aircrafts & card(spdlmt) = curr_aircrafts & card(altlmt) = curr_aircrafts & card(hdng) = curr_aircrafts & card(currspd) = curr_aircrafts & card(curralt) = curr_aircrafts)
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
  Expanded_List_Initialisation(Machine(atcsystem))==(zone_states,curr_aircrafts,ids,spdlmt,altlmt,currpos,hdng,currspd,curralt:={(0,0)|->CLEAR,(0,1)|->CLEAR,(0,2)|->CLEAR,(0,3)|->CLEAR,(1,0)|->CLEAR,(1,1)|->CLEAR,(1,2)|->CLEAR,(1,3)|->CLEAR,(2,0)|->CLEAR,(2,1)|->CLEAR,(2,2)|->CLEAR,(2,3)|->CLEAR,(3,0)|->CLEAR,(3,1)|->CLEAR,(3,2)|->CLEAR,(3,3)|->CLEAR},0,{},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(atcsystem))==(skip);
  List_Initialisation(Machine(atcsystem))==(zone_states:={(0,0)|->CLEAR,(0,1)|->CLEAR,(0,2)|->CLEAR,(0,3)|->CLEAR,(1,0)|->CLEAR,(1,1)|->CLEAR,(1,2)|->CLEAR,(1,3)|->CLEAR,(2,0)|->CLEAR,(2,1)|->CLEAR,(2,2)|->CLEAR,(2,3)|->CLEAR,(3,0)|->CLEAR,(3,1)|->CLEAR,(3,2)|->CLEAR,(3,3)|->CLEAR} || curr_aircrafts:=0 || ids:={} || spdlmt:={} || altlmt:={} || currpos:={} || hdng:={} || currspd:={} || curralt:={})
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
  Internal_List_Operations(Machine(atcsystem))==(takeoff_from,change_direction,speedup,slowdown);
  List_Operations(Machine(atcsystem))==(takeoff_from,change_direction,speedup,slowdown)
END
&
THEORY ListInputX IS
  List_Input(Machine(atcsystem),takeoff_from)==(aa,pp);
  List_Input(Machine(atcsystem),change_direction)==(ii,hh);
  List_Input(Machine(atcsystem),speedup)==(ii);
  List_Input(Machine(atcsystem),slowdown)==(ii)
END
&
THEORY ListOutputX IS
  List_Output(Machine(atcsystem),takeoff_from)==(?);
  List_Output(Machine(atcsystem),change_direction)==(?);
  List_Output(Machine(atcsystem),speedup)==(?);
  List_Output(Machine(atcsystem),slowdown)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(atcsystem),takeoff_from)==(takeoff_from(aa,pp));
  List_Header(Machine(atcsystem),change_direction)==(change_direction(ii,hh));
  List_Header(Machine(atcsystem),speedup)==(speedup(ii));
  List_Header(Machine(atcsystem),slowdown)==(slowdown(ii))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(atcsystem),takeoff_from)==(aa: AIRCRAFT & pp: airport & zone_states(pp'xx,pp'yy) = CLEAR & curr_aircrafts<capacity);
  List_Precondition(Machine(atcsystem),change_direction)==(ii: ran(ids) & hh: DIRECTION-{hdng(ids~(ii))});
  List_Precondition(Machine(atcsystem),speedup)==(ii: ran(ids) & currspd(ids~(ii))<spdlmt(ids~(ii)));
  List_Precondition(Machine(atcsystem),slowdown)==(ii: ran(ids) & currspd(ids~(ii))<1)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(atcsystem),slowdown)==(ii: ran(ids) & currspd(ids~(ii))<1 | currspd:=currspd<+{ids~(ii)|->currspd(ids~(ii))-1});
  Expanded_List_Substitution(Machine(atcsystem),speedup)==(ii: ran(ids) & currspd(ids~(ii))<spdlmt(ids~(ii)) | currspd:=currspd<+{ids~(ii)|->currspd(ids~(ii))+1});
  Expanded_List_Substitution(Machine(atcsystem),change_direction)==(ii: ran(ids) & hh: DIRECTION-{hdng(ids~(ii))} | hdng:=hdng<+{ids~(ii)|->hh});
  Expanded_List_Substitution(Machine(atcsystem),takeoff_from)==(aa: AIRCRAFT & pp: airport & zone_states(pp'xx,pp'yy) = CLEAR & curr_aircrafts<capacity | ids,spdlmt,altlmt,hdng,currspd,curralt,curr_aircrafts,zone_states:=ids\/{aa|->curr_aircrafts+1},spdlmt\/{aa|->1},altlmt\/{aa|->1},hdng\/{aa|->NN},currspd\/{aa|->3},curralt\/{aa|->3},curr_aircrafts+1,zone_states<+{(pp'xx,pp'yy)|->OCCUPIED});
  List_Substitution(Machine(atcsystem),takeoff_from)==(ids:=ids\/{aa|->curr_aircrafts+1} || spdlmt:=spdlmt\/{aa|->1} || altlmt:=altlmt\/{aa|->1} || hdng:=hdng\/{aa|->NN} || currspd:=currspd\/{aa|->3} || curralt:=curralt\/{aa|->3} || curr_aircrafts:=curr_aircrafts+1 || zone_states(pp'xx,pp'yy):=OCCUPIED);
  List_Substitution(Machine(atcsystem),change_direction)==(hdng(ids~(ii)):=hh);
  List_Substitution(Machine(atcsystem),speedup)==(currspd(ids~(ii)):=currspd(ids~(ii))+1);
  List_Substitution(Machine(atcsystem),slowdown)==(currspd(ids~(ii)):=currspd(ids~(ii))-1)
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
  Context_List_Defered(Machine(atcsystem))==(AIRCRAFT);
  Context_List_Sets(Machine(atcsystem))==(DIRECTION,STATE,AIRCRAFT);
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
  Context_List_Properties(Machine(atcsystem))==(total: NAT1 & capacity: NAT1 & capacity<total & card(AIRCRAFT) = total & mapw = 3 & maph = 3 & mapa = (0..maph)*(0..mapw) & airport <: struct(xx>>(0..mapw),yy>>(0..maph)) & AIRCRAFT: FIN(INTEGER) & not(AIRCRAFT = {}) & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}) & STATE: FIN(INTEGER) & not(STATE = {}));
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
  List_ANY_Var(Machine(atcsystem),takeoff_from)==(?);
  List_ANY_Var(Machine(atcsystem),change_direction)==(?);
  List_ANY_Var(Machine(atcsystem),speedup)==(?);
  List_ANY_Var(Machine(atcsystem),slowdown)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(atcsystem)) == (? | ? | curralt,currspd,hdng,currpos,altlmt,spdlmt,ids,curr_aircrafts,zone_states | ? | takeoff_from,change_direction,speedup,slowdown | ? | seen(Machine(atcsystem_ctx)) | ? | atcsystem);
  List_Of_HiddenCst_Ids(Machine(atcsystem)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem)) == (?);
  List_Of_VisibleVar_Ids(Machine(atcsystem)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem)) == (?: ?);
  List_Of_Ids(Machine(atcsystem_ctx)) == (total,capacity,mapw,maph,mapa,airport,DIRECTION,STATE,AIRCRAFT,NN,SS,EE,WW,CLEAR,OCCUPIED | ? | ? | ? | ? | ? | ? | ? | atcsystem_ctx);
  List_Of_HiddenCst_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem_ctx)) == (total,capacity,mapw,maph,mapa,airport);
  List_Of_VisibleVar_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(atcsystem)) == (Type(curralt) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(currspd) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(hdng) == Mvl(SetOf(atype(AIRCRAFT,?,?)*etype(DIRECTION,?,?)));Type(currpos) == Mvl(SetOf(atype(AIRCRAFT,?,?)*rtype((posx: btype(INTEGER,?,?)),posy: btype(INTEGER,?,?))));Type(altlmt) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(spdlmt) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(ids) == Mvl(SetOf(atype(AIRCRAFT,?,?)*btype(INTEGER,?,?)));Type(curr_aircrafts) == Mvl(btype(INTEGER,?,?));Type(zone_states) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)*etype(STATE,0,1))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(atcsystem)) == (Type(slowdown) == Cst(No_type,btype(INTEGER,?,?));Type(speedup) == Cst(No_type,btype(INTEGER,?,?));Type(change_direction) == Cst(No_type,btype(INTEGER,?,?)*etype(DIRECTION,?,?));Type(takeoff_from) == Cst(No_type,atype(AIRCRAFT,?,?)*rtype((xx: btype(INTEGER,0,mapw)),yy: btype(INTEGER,0,maph))))
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
