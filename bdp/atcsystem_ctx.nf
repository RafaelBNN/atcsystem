Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(atcsystem_ctx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(atcsystem_ctx))==(Machine(atcsystem_ctx));
  Level(Machine(atcsystem_ctx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(atcsystem_ctx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(atcsystem_ctx))==(?);
  List_Includes(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(atcsystem_ctx))==(?);
  Context_List_Variables(Machine(atcsystem_ctx))==(?);
  Abstract_List_Variables(Machine(atcsystem_ctx))==(?);
  Local_List_Variables(Machine(atcsystem_ctx))==(?);
  List_Variables(Machine(atcsystem_ctx))==(?);
  External_List_Variables(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(atcsystem_ctx))==(?);
  Abstract_List_VisibleVariables(Machine(atcsystem_ctx))==(?);
  External_List_VisibleVariables(Machine(atcsystem_ctx))==(?);
  Expanded_List_VisibleVariables(Machine(atcsystem_ctx))==(?);
  List_VisibleVariables(Machine(atcsystem_ctx))==(?);
  Internal_List_VisibleVariables(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(atcsystem_ctx))==(btrue);
  Gluing_List_Invariant(Machine(atcsystem_ctx))==(btrue);
  Expanded_List_Invariant(Machine(atcsystem_ctx))==(btrue);
  Abstract_List_Invariant(Machine(atcsystem_ctx))==(btrue);
  Context_List_Invariant(Machine(atcsystem_ctx))==(btrue);
  List_Invariant(Machine(atcsystem_ctx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(atcsystem_ctx))==(btrue);
  Abstract_List_Assertions(Machine(atcsystem_ctx))==(btrue);
  Context_List_Assertions(Machine(atcsystem_ctx))==(btrue);
  List_Assertions(Machine(atcsystem_ctx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(atcsystem_ctx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(atcsystem_ctx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(atcsystem_ctx))==(skip);
  Context_List_Initialisation(Machine(atcsystem_ctx))==(skip);
  List_Initialisation(Machine(atcsystem_ctx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(atcsystem_ctx))==(btrue);
  List_Constraints(Machine(atcsystem_ctx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(atcsystem_ctx))==(?);
  List_Operations(Machine(atcsystem_ctx))==(?)
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
  List_Valuable_Constants(Machine(atcsystem_ctx))==(capacity,mapw,maph,airport);
  Inherited_List_Constants(Machine(atcsystem_ctx))==(?);
  List_Constants(Machine(atcsystem_ctx))==(capacity,mapw,maph,airport)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(atcsystem_ctx),DIRECTION)==({NN,SS,EE,WW});
  Context_List_Enumerated(Machine(atcsystem_ctx))==(?);
  Context_List_Defered(Machine(atcsystem_ctx))==(?);
  Context_List_Sets(Machine(atcsystem_ctx))==(?);
  List_Valuable_Sets(Machine(atcsystem_ctx))==(?);
  Inherited_List_Enumerated(Machine(atcsystem_ctx))==(?);
  Inherited_List_Defered(Machine(atcsystem_ctx))==(?);
  Inherited_List_Sets(Machine(atcsystem_ctx))==(?);
  List_Enumerated(Machine(atcsystem_ctx))==(DIRECTION,STATE);
  List_Defered(Machine(atcsystem_ctx))==(?);
  List_Sets(Machine(atcsystem_ctx))==(DIRECTION,STATE);
  Set_Definition(Machine(atcsystem_ctx),STATE)==({CLEAR,OCCUPIED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(atcsystem_ctx))==(?);
  Expanded_List_HiddenConstants(Machine(atcsystem_ctx))==(?);
  List_HiddenConstants(Machine(atcsystem_ctx))==(?);
  External_List_HiddenConstants(Machine(atcsystem_ctx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(atcsystem_ctx))==(btrue);
  Context_List_Properties(Machine(atcsystem_ctx))==(btrue);
  Inherited_List_Properties(Machine(atcsystem_ctx))==(btrue);
  List_Properties(Machine(atcsystem_ctx))==(capacity: NAT1 & mapw = 3 & maph = 3 & airport <: struct(xx>>(0..3),yy>>(0..3)) & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}) & STATE: FIN(INTEGER) & not(STATE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(atcsystem_ctx)) == (capacity,mapw,maph,airport,DIRECTION,STATE,NN,SS,EE,WW,CLEAR,OCCUPIED | ? | ? | ? | ? | ? | ? | ? | atcsystem_ctx);
  List_Of_HiddenCst_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(atcsystem_ctx)) == (capacity,mapw,maph,airport);
  List_Of_VisibleVar_Ids(Machine(atcsystem_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(atcsystem_ctx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(atcsystem_ctx)) == (Type(DIRECTION) == Cst(SetOf(etype(DIRECTION,0,3)));Type(STATE) == Cst(SetOf(etype(STATE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(atcsystem_ctx)) == (Type(NN) == Cst(etype(DIRECTION,0,3));Type(SS) == Cst(etype(DIRECTION,0,3));Type(EE) == Cst(etype(DIRECTION,0,3));Type(WW) == Cst(etype(DIRECTION,0,3));Type(CLEAR) == Cst(etype(STATE,0,1));Type(OCCUPIED) == Cst(etype(STATE,0,1));Type(capacity) == Cst(btype(INTEGER,?,?));Type(mapw) == Cst(btype(INTEGER,?,?));Type(maph) == Cst(btype(INTEGER,?,?));Type(airport) == Cst(SetOf(rtype((xx: btype(INTEGER,0,3)),yy: btype(INTEGER,0,3)))))
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
