part of 'preregister_person_bloc.dart';

abstract class PreregisterPersonPageState {

  Exception? e;
  int currentStep;
  List<TypeDocumentModel> typeDocumentModel;
  List<TypeInhabitantModel> listTypeInhabitants;
  PersonModel? currentPerson;
  String? errorCellPhone;
  String? errorDirection;
  String? errorDocumentation;
  String? errorNameLastName;
  TypeDocumentModel? typeDocumentModelSelected;
  TypeInhabitantModel? typeInhabitantSelected;
  bool showDialog;

  PreregisterPersonPageState({
    this.currentPerson,
    this.currentStep = 0,
    this.e,
    this.errorCellPhone,
    this.errorDirection,
    this.errorDocumentation,
    this.errorNameLastName,
    this.listTypeInhabitants = const <TypeInhabitantModel>[],
    this.typeDocumentModel = const <TypeDocumentModel>[],
    this.typeDocumentModelSelected,
    this.typeInhabitantSelected,
    this.showDialog = false,
  });
}

class PreregisterPersonPageInitState extends PreregisterPersonPageState{}
class PreregisterPersonPageLoadingState extends PreregisterPersonPageState{}

class PreregisterPersonPageLoadedState extends PreregisterPersonPageState{

  PreregisterPersonPageLoadedState({
    required int currentStep,
    required List<TypeDocumentModel> listTypeDocumentModel,
    required List<TypeInhabitantModel> listTypeInhabitants,
    required PersonModel person,
    required TypeDocumentModel typeDocumentModelSelected,
    required TypeInhabitantModel? typeInhabitantSelected,
  }): super(
    currentStep: currentStep,
    currentPerson: person,
    listTypeInhabitants: listTypeInhabitants,
    typeDocumentModel: listTypeDocumentModel,
    typeDocumentModelSelected: typeDocumentModelSelected,
    typeInhabitantSelected: typeInhabitantSelected,
  );
}

class PreregisterPersonPageUpdatePersonState extends PreregisterPersonPageState{

  PreregisterPersonPageUpdatePersonState({
    required int currentStep,
    required List<TypeDocumentModel> listTypeDocumentModel,
    required List<TypeInhabitantModel> listTypeInhabitants,
    required PersonModel person,
    required TypeDocumentModel typeDocumentModelSelected,
    required TypeInhabitantModel? typeInhabitantSelected,
  }): super(
    currentStep: currentStep,
    currentPerson: person,
    listTypeInhabitants: listTypeInhabitants,
    typeDocumentModel: listTypeDocumentModel,
    typeDocumentModelSelected: typeDocumentModelSelected,
    typeInhabitantSelected: typeInhabitantSelected,
  );
}
class PreregisterPersonPageSendPersonState extends PreregisterPersonPageState{}

class PreregisterPersonPageSuccessState extends PreregisterPersonPageState{}

class PreregisterPersonPageErrorState extends PreregisterPersonPageState{

  PreregisterPersonPageErrorState({
    required Exception e,
    required int currentStep,
    bool showDialog = false,
    List<TypeDocumentModel>? listTypeDocumentModel,
    List<TypeInhabitantModel>? listTypeInhabitants,
    PersonModel? person,
    TypeDocumentModel? typeDocumentModelSelected,
    TypeInhabitantModel? typeInhabitantSelected,
    String? errorCellPhone,
    String? errorDirection,
    String? errorDocumentation,
    String? errorNameLastName,
  }): super(
    e: e,
    errorCellPhone: errorCellPhone,
    errorDirection: errorDirection,
    errorDocumentation: errorDocumentation,
    errorNameLastName: errorNameLastName,
    currentStep: currentStep,
    currentPerson: person,
    listTypeInhabitants: listTypeInhabitants ?? <TypeInhabitantModel>[],
    typeDocumentModel: listTypeDocumentModel ?? <TypeDocumentModel>[],
    typeDocumentModelSelected: typeDocumentModelSelected,
    typeInhabitantSelected: typeInhabitantSelected,
    showDialog: showDialog
  );
}