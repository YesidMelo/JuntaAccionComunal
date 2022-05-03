part of 'preregister_person_bloc.dart';

abstract class PreregisterPersonPageEvent{
  PersonModel? currentPerson;
  int currentStep = 0;
  List<TypeDocumentModel> listDocuments = <TypeDocumentModel>[];
  TypeDocumentModel? typeDocumentModelSelected;
}

class PreregisterPersonPageLoadEvent  extends PreregisterPersonPageEvent{

  final PreregisterPersonGetCurrentPersonUseCase _getCurrentPersonUseCase = getIt<PreregisterPersonGetCurrentPersonUseCase>();
  final PreregisterPersonCreateNewPersonUseCase _createNewPersonUseCase = getIt<PreregisterPersonCreateNewPersonUseCase>();
  final GetTypeDocumentUseCase _getTypeDocumentUseCase = getIt<GetTypeDocumentUseCase>();

  Future<PreregisterPersonDataLoad> loadElements() async {

    await _createNewPersonUseCase.invoke();
    PersonModel model = await _getCurrentPersonUseCase.invoke();
    List<TypeDocumentModel> listDocuments = await _getTypeDocumentUseCase.invoke();

    return PreregisterPersonDataLoad(
      listTypeDocuments: listDocuments,
      personModel: model
    );
  }
}

class PreregisterPersonPageUpdatePersonEvent extends PreregisterPersonPageEvent {

  PreregisterPersonPageUpdatePersonEvent({
    required PersonModel currentPerson,
    required int currentStep,
    required List<TypeDocumentModel> listDocuments,
    required TypeDocumentModel? typeDocumentModelSelected,
  }) {
    super.typeDocumentModelSelected = typeDocumentModelSelected;
    super.currentStep = currentStep;
    super.currentPerson = currentPerson;
    super.listDocuments = listDocuments;
  }
}

class PreregisterPersonPageNextStepEvent extends PreregisterPersonPageEvent {
  PreregisterPersonPageNextStepEvent({
    required PersonModel currentPerson,
    required int currentStep,
    required List<TypeDocumentModel> listDocuments,
    required TypeDocumentModel? typeDocumentModelSelected,
  }) {
    super.typeDocumentModelSelected = typeDocumentModelSelected;
    super.currentStep = currentStep;
    super.currentPerson = currentPerson;
    super.listDocuments = listDocuments;
  }
}

class PreregisterPersonPageBackStepEvent extends PreregisterPersonPageEvent {

  PreregisterPersonPageBackStepEvent({
    required PersonModel currentPerson,
    required int currentStep,
    required List<TypeDocumentModel> listDocuments,
    required TypeDocumentModel? typeDocumentModelSelected,
  }) {
    super.typeDocumentModelSelected = typeDocumentModelSelected;
    super.currentStep = currentStep;
    super.currentPerson = currentPerson;
    super.listDocuments = listDocuments;
  }
}

class PreregisterPersonPageSendPersonEvent extends PreregisterPersonPageEvent{}