part of 'preregister_person_bloc.dart';

abstract class PreregisterPersonPageState {

  int currentStep;
  List<TypeDocumentModel> typeDocumentModel;
  List<TypeInhabitantModel> listTypeInhabitants;
  PersonModel? currentPerson;
  TypeDocumentModel? typeDocumentModelSelected;
  TypeInhabitantModel? typeInhabitantSelected;

  PreregisterPersonPageState({
    this.currentPerson,
    this.currentStep = 0,
    this.listTypeInhabitants = const <TypeInhabitantModel>[],
    this.typeDocumentModel = const <TypeDocumentModel>[],
    this.typeDocumentModelSelected,
    this.typeInhabitantSelected,
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
  Exception e;

  PreregisterPersonPageErrorState({
    required this.e
  }): super();
}