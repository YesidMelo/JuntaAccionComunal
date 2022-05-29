import 'package:jac/core/core.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/common_ui.dart';

part 'edit_person_data.dart';
part 'edit_person_event.dart';
part 'edit_person_state.dart';

class EditPersonBloc extends BaseBloc<EditPersonEvent, EditPersonState>  {
  EditPersonBloc() : super(EditPersonInitialState()) {
    on(_listenerLoadPersonEvent);
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
}