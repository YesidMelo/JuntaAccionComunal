import 'package:jac/core/core.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/blocs/person/preregister_person/preregister_person_data.dart';
import 'package:jac/ui/common_ui.dart';

part 'preregister_person_event.dart';
part 'preregister_person_state.dart';

class PreregisterPersonBloc extends BaseBloc<PreregisterPersonPageEvent, PreregisterPersonPageState> {

  PreregisterPersonBloc() : super(PreregisterPersonPageInitState()){
    on(_listenerLoadEvent);
    on(_listenerUpdatePerson);
    on(_litenerSendPerson);
    on(_litenerNextStep);
    on(_litenerBackStep);
  }

  void _listenerLoadEvent(PreregisterPersonPageLoadEvent event, Emitter emit) async {
    try {
      emit(PreregisterPersonPageLoadingState());
      PreregisterPersonDataLoad data = await event.loadElements();
      emit(PreregisterPersonPageLoadedState(
          currentStep: 0,
          listTypeDocumentModel: data.listTypeDocuments,
          listTypeInhabitants: data.listInhabitant,
          person: data.personModel!,
          typeDocumentModelSelected: data.listTypeDocuments.first,
          typeInhabitantSelected: data.listInhabitant.first,
        )
      );
    } on PersonModelNullException {
      emit(PreregisterPersonPageErrorState(
        e: PersonModelNullException(),
        currentStep: 0,
        showDialog: true
      ));
    } on ListTypeDocumentEmptyException {
      emit(PreregisterPersonPageErrorState(
        e: ListTypeDocumentEmptyException(),
        currentStep: 0,
        showDialog: true
      ));
    } on ListTypeInhabitantEmptyException {
      emit(PreregisterPersonPageErrorState(
        e: ListTypeInhabitantEmptyException(),
        currentStep: 0,
        showDialog: true
      ));
    }

  }

  void _listenerUpdatePerson(PreregisterPersonPageUpdatePersonEvent event, Emitter emit) {
    emit(PreregisterPersonPageUpdatePersonState(
      currentStep: event.currentStep,
      listTypeDocumentModel: event.listDocuments,
      listTypeInhabitants: event.listTypeInhabitants,
      person: event.currentPerson!,
      typeDocumentModelSelected: event.typeDocumentModelSelected!,
      typeInhabitantSelected: event.typeInhabitantSelected,
    ));
  }


  void _litenerNextStep(PreregisterPersonPageNextStepEvent event, Emitter emit) {
    try {
      if(event.currentStep == 0) {
        event.currentPerson?.nameLastname.validNameAndLastName();
        event.currentPerson?.documentNumber.validDocumentationNumber();
      }


      emit(PreregisterPersonPageUpdatePersonState(
        currentStep: event.currentStep + 1,
        listTypeDocumentModel: event.listDocuments,
        listTypeInhabitants: event.listTypeInhabitants,
        person: event.currentPerson!,
        typeDocumentModelSelected: event.typeDocumentModelSelected!,
        typeInhabitantSelected: event.typeInhabitantSelected,
      ));
    } on NameAndLastNameEmptyException catch (e, stacktrace){
      _sendErrors(
        e: e,
        emit: emit,
        event: event,
        stacktrace: stacktrace,
        errorNameLastName: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.thisFieldIsEmpty)
      );
    } on NameAndLastNameLengthException catch (e, stacktrace){
      _sendErrors(
        e: e,
        emit: emit,
        event: event,
        stacktrace: stacktrace,
        errorNameLastName: LanguageFactory
            .getCurrentLanguage()
            .getWorld(world: Worlds.preregisterTheMinimumSizeNameIs)
            .format(args: <String>[Constants.preregisterMinimunCharacterByName.toString()])
      );
    } on NumberDocumentationEmptyException catch(e, stacktrace){
      _sendErrors(
        e: e,
        emit: emit,
        event: event,
        stacktrace: stacktrace,
        errorDocumentation: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.thisFieldIsEmpty)
      );
    } on NumberDocumentationLengthException catch (e, stacktrace){
      _sendErrors(
        e: e,
        emit: emit,
        event: event,
        stacktrace: stacktrace,
          errorNameLastName: LanguageFactory
            .getCurrentLanguage()
            .getWorld(world: Worlds.preregisterTheMinimumSizeDocumentIs)
            .format(args: <String>[Constants.preregisterMinimunCharacterByDocument.toString()])
      );
    }
  }

  void _litenerBackStep(PreregisterPersonPageBackStepEvent event, Emitter emit) {
    if(event.currentStep == 0) return;
    emit(PreregisterPersonPageUpdatePersonState(
        currentStep: event.currentStep - 1,
        listTypeDocumentModel: event.listDocuments,
        listTypeInhabitants: event.listTypeInhabitants,
        person: event.currentPerson!,
        typeDocumentModelSelected: event.typeDocumentModelSelected!,
        typeInhabitantSelected: event.typeInhabitantSelected,
    ));
  }

  void _litenerSendPerson(PreregisterPersonPageSendPersonEvent event, Emitter emit) {

  }

  ///private methods
  void _sendErrors({
    required CoreException e,
    required Emitter emit,
    required PreregisterPersonPageEvent event,
    required StackTrace stacktrace,
    String? errorCellPhone,
    String? errorDirection,
    String? errorDocumentation,
    String? errorNameLastName,
  }) {
    sendEventToAnalytics(exception: e, stacktrace: stacktrace);
    emit(
        PreregisterPersonPageErrorState(
          e: e,
          currentStep: event.currentStep,
          listTypeDocumentModel: event.listDocuments,
          listTypeInhabitants: event.listTypeInhabitants,
          person: event.currentPerson!,
          typeDocumentModelSelected: event.typeDocumentModelSelected!,
          typeInhabitantSelected: event.typeInhabitantSelected,
          errorCellPhone: errorCellPhone,
          errorDirection: errorDirection,
          errorDocumentation: errorDocumentation,
          errorNameLastName: errorNameLastName,
        )
    );
  }
}


