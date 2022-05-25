import 'package:jac/core/core.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/common_ui.dart';

part 'list_person_event.dart';
part 'list_person_state.dart';
part 'list_person_data.dart';

class ListPersonBloc extends BaseBloc<ListPersonEvent, ListPersonState> {
  ListPersonBloc() : super(ListPersonInitState()) {
    on(_listenerLoadEvent);
    on(_listenerFilterList);
  }

  void _listenerLoadEvent(ListPersonLoadEvent event, Emitter emit) async {
    emit(ListPersonLoadingState(listPersonData: event.listPersonData));
    try {
      ListPersonData data = await event.loadElements();
      data.stateFiltered = data.listStatePersonRegistered.findFirst(condition: (current) => current.id == Constants.idAll);

      emit(ListPersonLoadedState(listPersonData: data));

    } on NotConnectionInternetException catch (e, stacktrace) {
      print(stacktrace.toString());
      emit(ListPersonLoadedState(listPersonData: event.listPersonData));
    } catch (e, stacktrace) {
      print(stacktrace.toString());

    }
  }

  void _listenerFilterList(ListPersonFilterEvent event, Emitter emit) async {
    if(event.listPersonData.stateFiltered == null) return;
    emit(ListPersonLoadingState(listPersonData: event.listPersonData));

    List<PersonModel> filtered = event
      .listPersonData
      .listPersons
      .filter(
        condition: (personModel) => personModel.stateRegisterId == event.listPersonData.stateFiltered?.id
      );

    ListPersonData data = event.listPersonData.copyWith(
      listPersonsFiltered: filtered,
      showErrorEmptyListPersonFiltered: filtered.isEmpty && event.listPersonData.stateFiltered?.id != Constants.idAll
    );

    emit(ListPersonFilteredState(listPersonData: data));
  }

}