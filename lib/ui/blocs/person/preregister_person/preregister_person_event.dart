part of 'preregister_person_bloc.dart';

abstract class PreregisterPersonPageEvent{
  int currentStep = 0;
  List<TypeDocumentModel> listDocuments = <TypeDocumentModel>[];
  List<TypeInhabitantModel> listTypeInhabitants = <TypeInhabitantModel>[];
  PersonModel? currentPerson;
  TypeDocumentModel? typeDocumentModelSelected;
  TypeInhabitantModel? typeInhabitantSelected;
}

class PreregisterPersonPageLoadEvent  extends PreregisterPersonPageEvent{

  final PreregisterPersonGetCurrentPersonUseCase _getCurrentPersonUseCase = getIt<PreregisterPersonGetCurrentPersonUseCase>();
  final PreregisterPersonCreateNewPersonUseCase _createNewPersonUseCase = getIt<PreregisterPersonCreateNewPersonUseCase>();
  final GetTypeDocumentUseCase _getTypeDocumentUseCase = getIt<GetTypeDocumentUseCase>();
  final GetTypeInhabitantsUseCase _getTypeInhabitantsUseCase = getIt<GetTypeInhabitantsUseCase>();
  final GetStatesRegisteredUseCase _getStatesRegisteredUseCase = getIt<GetStatesRegisteredUseCase>();

  Future<PreregisterPersonDataLoad> loadElements() async {

    await _createNewPersonUseCase.invoke();
    PersonModel model = await _getCurrentPersonUseCase.invoke();
    List<TypeDocumentModel> listDocuments = await _getTypeDocumentUseCase.invoke();
    List<TypeInhabitantModel> listInhabitant = await _getTypeInhabitantsUseCase.invoke();
    List<StateRegisteredPersonModel> listStates = await _getStatesRegisteredUseCase.invoke();
    return PreregisterPersonDataLoad(
      listInhabitant: listInhabitant,
      listStateRegistered: listStates,
      listTypeDocuments: listDocuments,
      personModel: model,
    );
  }
}

class PreregisterPersonPageUpdatePersonEvent extends PreregisterPersonPageEvent {

  PreregisterPersonPageUpdatePersonEvent({
    required PersonModel currentPerson,
    required int currentStep,
    required List<TypeDocumentModel> listDocuments,
    required TypeDocumentModel? typeDocumentModelSelected,
    required List<TypeInhabitantModel> listTypeInhabitants,
    required TypeInhabitantModel? typeInhabitantSelected,
  }) {
    super.typeDocumentModelSelected = typeDocumentModelSelected;
    super.currentStep = currentStep;
    super.currentPerson = currentPerson;
    super.listDocuments = listDocuments;
    super.listTypeInhabitants = listTypeInhabitants;
    super.typeInhabitantSelected = typeInhabitantSelected;
  }
}

class PreregisterPersonPageNextStepEvent extends PreregisterPersonPageEvent {
  PreregisterPersonPageNextStepEvent({
    required PersonModel currentPerson,
    required int currentStep,
    required List<TypeDocumentModel> listDocuments,
    required TypeDocumentModel? typeDocumentModelSelected,
    required List<TypeInhabitantModel> listTypeInhabitants,
    required TypeInhabitantModel? typeInhabitantSelected,
  }) {
    super.typeDocumentModelSelected = typeDocumentModelSelected;
    super.currentStep = currentStep;
    super.currentPerson = currentPerson;
    super.listDocuments = listDocuments;
    super.listTypeInhabitants = listTypeInhabitants;
    super.typeInhabitantSelected = typeInhabitantSelected;
  }
}

class PreregisterPersonPageBackStepEvent extends PreregisterPersonPageEvent {

  PreregisterPersonPageBackStepEvent({
    required PersonModel currentPerson,
    required int currentStep,
    required List<TypeDocumentModel> listDocuments,
    required TypeDocumentModel? typeDocumentModelSelected,
    required List<TypeInhabitantModel> listTypeInhabitants,
    required TypeInhabitantModel? typeInhabitantSelected,
  }) {
    super.typeDocumentModelSelected = typeDocumentModelSelected;
    super.currentStep = currentStep;
    super.currentPerson = currentPerson;
    super.listDocuments = listDocuments;
    super.listTypeInhabitants = listTypeInhabitants;
    super.typeInhabitantSelected = typeInhabitantSelected;
  }
}

class PreregisterPersonPageSendPersonEvent extends PreregisterPersonPageEvent{

  final PreregisterPersonSendPersonUseCase _sendPersonUseCase = getIt<PreregisterPersonSendPersonUseCase>();

  PreregisterPersonPageSendPersonEvent({
    required PersonModel currentPerson,
    required int currentStep,
    required List<TypeDocumentModel> listDocuments,
    required TypeDocumentModel? typeDocumentModelSelected,
    required List<TypeInhabitantModel> listTypeInhabitants,
    required TypeInhabitantModel? typeInhabitantSelected,
  }) {
    super.typeDocumentModelSelected = typeDocumentModelSelected;
    super.currentStep = currentStep;
    super.currentPerson = currentPerson;
    super.listDocuments = listDocuments;
    super.listTypeInhabitants = listTypeInhabitants;
    super.typeInhabitantSelected = typeInhabitantSelected;
  }

  Future<bool> sendPerson() async {
    if(currentPerson == null) throw PersonModelNullException();
    await _sendPersonUseCase.invoke(personModel: currentPerson!);
    return true;
  }
}