part of 'preregister_person_bloc.dart';

abstract class PreregisterPersonPageState {
  PersonModel? currentPerson;
  List<TypeDocumentModel> typeDocumentModel;
  TypeDocumentModel? typeDocumentModelSelected;
  int currentStep;
  PreregisterPersonPageState({
    this.currentPerson,
    this.typeDocumentModel = const <TypeDocumentModel>[],
    this.typeDocumentModelSelected,
    this.currentStep = 0
  });
}

class PreregisterPersonPageInitState extends PreregisterPersonPageState{}
class PreregisterPersonPageLoadingState extends PreregisterPersonPageState{}

class PreregisterPersonPageLoadedState extends PreregisterPersonPageState{
  PreregisterPersonPageLoadedState({
    required PersonModel person,
    required List<TypeDocumentModel> listTypeDocumentModel,
    required TypeDocumentModel typeDocumentModelSelected
  }): super(
    currentPerson: person,
    typeDocumentModel: listTypeDocumentModel,
    typeDocumentModelSelected: typeDocumentModelSelected
  );
}

class PreregisterPersonPageUpdatePersonState extends PreregisterPersonPageState{
  PreregisterPersonPageUpdatePersonState({
    required PersonModel person,
    required List<TypeDocumentModel> listTypeDocumentModel,
    required TypeDocumentModel typeDocumentModelSelected,
    required int currentStep
  }): super(
      currentPerson: person,
      typeDocumentModel: listTypeDocumentModel,
      typeDocumentModelSelected: typeDocumentModelSelected,
      currentStep: currentStep
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