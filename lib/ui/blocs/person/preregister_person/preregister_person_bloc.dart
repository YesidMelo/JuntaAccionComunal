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
          person: data.personModel!,
          listTypeDocumentModel: data.listTypeDocuments,
          typeDocumentModelSelected: data.listTypeDocuments.first
        )
      );
    } on PersonModelNullException {
      emit(PreregisterPersonPageErrorState(e: PersonModelNullException()));
    } on ListTypeDocumentEmptyException {
      emit(PreregisterPersonPageErrorState(e: ListTypeDocumentEmptyException()));
    }

  }

  void _listenerUpdatePerson(PreregisterPersonPageUpdatePersonEvent event, Emitter emit) {
    emit(PreregisterPersonPageUpdatePersonState(
      currentStep: event.currentStep,
      typeDocumentModelSelected: event.typeDocumentModelSelected!,
      person: event.currentPerson!,
      listTypeDocumentModel: event.listDocuments
    ));
  }

  void _litenerNextStep(PreregisterPersonPageNextStepEvent event, Emitter emit) {
    emit(PreregisterPersonPageUpdatePersonState(
        currentStep: event.currentStep + 1,
        typeDocumentModelSelected: event.typeDocumentModelSelected!,
        person: event.currentPerson!,
        listTypeDocumentModel: event.listDocuments
    ));
  }

  void _litenerBackStep(PreregisterPersonPageBackStepEvent event, Emitter emit) {
    if(event.currentStep == 0) return;
    emit(PreregisterPersonPageUpdatePersonState(
        currentStep: event.currentStep - 1,
        typeDocumentModelSelected: event.typeDocumentModelSelected!,
        person: event.currentPerson!,
        listTypeDocumentModel: event.listDocuments
    ));
  }

  void _litenerSendPerson(PreregisterPersonPageSendPersonEvent event, Emitter emit) {

  }
}


