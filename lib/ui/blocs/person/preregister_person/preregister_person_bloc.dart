import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';

part 'preregister_person_event.dart';
part 'preregister_person_state.dart';

class PreregisterPersonBloc extends Bloc<PreregisterPersonPageEvent, PreregisterPersonPageState> {

  PreregisterPersonBloc() : super(PreregisterPersonPageInitState()){
    on(_listenerLoadEvent);
    on(_listenerUpdatePerson);
    on(_litenerSendPerson);
  }

  void _listenerLoadEvent(PreregisterPersonPageLoadEvent event, Emitter emit) async {
    try {
      PersonModel model = await event.loadElements();
    } on PersonModelNull {
      emit(PreregisterPersonPageErrorState(e: PersonModelNull()));
    }
  }

  void _listenerUpdatePerson(PreregisterPersonPageUpdatePersonEvent event, Emitter emit) {

  }

  void _litenerSendPerson(PreregisterPersonPageSendPersonEvent event, Emitter emit) {

  }

}


