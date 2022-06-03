import 'package:jac/core/core.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/common_ui.dart';

part 'edit_person_data.dart';
part 'edit_person_event.dart';
part 'edit_person_state.dart';

class EditPersonBloc extends BaseBloc<EditPersonEvent, EditPersonState>  {
  EditPersonBloc() : super(EditPersonInitialState()) {
    on(_listenerLoadPersonEvent);
    on(_listenerChangeInfoEvent);
    on(_listenerEditPersonSendInfoEvent);
  }

  void _listenerLoadPersonEvent(EditPersonLoadingPersonEvent event, Emitter emit) async {
    try {
      emit(EditPersonLoadingState(data: event.data));
      EditPersonBlocData data = await event.loadPerson();
      emit(EditPersonLoadedState(data: data));
    } on CoreException catch(e, stackTrace) {
      print(stackTrace.toString());
      emit(EditPersonLoadedState(data: event.data));
    }
  }
  
  void _listenerChangeInfoEvent(EditPersonChangeInfoEvent event, Emitter emit) async {
    try {
      EditPersonBlocData data  = await event.changeInfo();
      emit(EditPersonChangeInformationState(data: data));
    } on CoreException catch (e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonLoadedState(data: event.data));
    }
  }

  void _listenerEditPersonSendInfoEvent(EditPersonSendInfoEvent event, Emitter emit) async {
    try {
      emit(EditPersonLoadingState(data: event.data));
      await event.sendData();
      event.data.editing = false;
      emit(EditPersonSendedState(data: event.data));
    } on PersonModelNullException catch  (e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(data: event.data, e: e, showDialog: true));
    } on NameAndLastNameLengthException catch(e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(
        data: event.data.copyWith(nameError: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.theMinimumSizeNameIs)),
        e: e
      ));
    } on StateRegisterPersonException catch(e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(
        data: event.data.copyWith(stateRegisterError: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.editPersonNotState)),
        e: e
      ));
    } on NumberDocumentationLengthException catch(e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(
        data: event.data.copyWith(numberDocumentError: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.theMinimumSizeDocumentIs)),
        e: e
      ));
    } on DirectionEmptyException catch(e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(
        data: event.data.copyWith(directionError: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.theMinimumSizeDirectionIs)),
        e: e
      ));
    } on DirectionLengthException catch(e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(
        data: event.data.copyWith(directionError: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.theMinimumSizeDirectionIs)),
        e: e
      ));
    } on CellphoneEmptyException catch(e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(
        data: event.data.copyWith(cellphoneError: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.theCellphoneNotIsValid)),
        e: e
      ));
    } on CellphoneLengthException catch(e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(
        data: event.data.copyWith(cellphoneError: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.theSizeCellphoneBetween)),
        e: e
      ));
    } on CoreException catch (e, stacktrace) {
      print(stacktrace.toString());
      emit(EditPersonSendInformationFailedState(data: event.data, e: e, showDialog: true));
    }
  }
  
}