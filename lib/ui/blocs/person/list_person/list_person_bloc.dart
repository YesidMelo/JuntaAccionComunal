import 'package:jac/core/core.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/common_ui.dart';

part 'list_person_event.dart';
part 'list_person_state.dart';
part 'list_person_data.dart';

class ListPersonBloc extends BaseBloc<ListPersonEvent, ListPersonState> {
  ListPersonBloc() : super(ListPersonInitState()) {
    on(_listenerLoadEvent);
  }

  void _listenerLoadEvent(ListPersonLoadEvent event, Emitter emit) async {
    emit(ListPersonLoadingState(
      listPersons: event.listPersonData.listPersons,
      listPersonsFiltered: event.listPersonData.listPersonsFiltered,
      listStateRegisteredPerson: event.listPersonData.listStatePersonRegistered
    ));
    try {
      ListPersonData data = await event.loadElements();
      emit(ListPersonLoadedState(
        listPersons: data.listPersons,
        listPersonsFiltered: data.listPersonsFiltered,
        listStateRegisteredPerson: data.listStatePersonRegistered
      ));
    } on NotConnectionInternetException catch (e, stacktrace) {
      print(stacktrace.toString());
      emit(ListPersonLoadedState(
        listPersons: event.listPersonData.listPersons,
        listPersonsFiltered: event.listPersonData.listPersonsFiltered,
        listStateRegisteredPerson: event.listPersonData.listStatePersonRegistered
      ));
    }
  }

}