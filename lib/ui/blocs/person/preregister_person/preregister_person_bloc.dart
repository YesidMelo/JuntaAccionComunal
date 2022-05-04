import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/person/preregister_person/preregister_person_data.dart';
import 'package:jac/ui/common_ui.dart';

part 'preregister_person_event.dart';
part 'preregister_person_state.dart';

class PreregisterPersonBloc extends Bloc<PreregisterPersonPageEvent, PreregisterPersonPageState> {

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
      emit(PreregisterPersonPageErrorState(e: PersonModelNullException()));
    } on ListTypeDocumentEmptyException {
      emit(PreregisterPersonPageErrorState(e: ListTypeDocumentEmptyException()));
    } on ListTypeInhabitantEmptyException {
      emit(PreregisterPersonPageErrorState(e: ListTypeInhabitantEmptyException()));
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
    emit(PreregisterPersonPageUpdatePersonState(
        currentStep: event.currentStep + 1,
        listTypeDocumentModel: event.listDocuments,
        listTypeInhabitants: event.listTypeInhabitants,
        person: event.currentPerson!,
        typeDocumentModelSelected: event.typeDocumentModelSelected!,
        typeInhabitantSelected: event.typeInhabitantSelected,
    ));
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
}


