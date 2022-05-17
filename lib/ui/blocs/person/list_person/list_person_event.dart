part of 'list_person_bloc.dart';

abstract class ListPersonEvent {
  ListPersonData listPersonData;
  ListPersonEvent({
    required this.listPersonData,
  });

}

class ListPersonLoadEvent extends ListPersonEvent {

  final GetPersonsUseCase _getPersonsUseCase = getIt<GetPersonsUseCase>();
  final GetStatesRegisteredUseCase _getStatesRegisteredUseCase = getIt<GetStatesRegisteredUseCase>();

  ListPersonLoadEvent() : super(listPersonData: ListPersonData());

  Future<ListPersonData> loadElements() async {
    ListPersonData data = ListPersonData();
    data.listPersons = await _getPersonsUseCase.invoke();
    data.listStatePersonRegistered = await _getStatesRegisteredUseCase.invoke();
    return data;
  }
}

class ListPersonFilterEvent extends ListPersonEvent {

  ListPersonFilterEvent({
    required ListPersonData listPersonData,
  }) : super(listPersonData: listPersonData);

  Future<ListPersonData> getPersonFiltered() async {
    if(listPersonData.statePersonId == null) return listPersonData;
    listPersonData.listPersonsFiltered = listPersonData.listPersons.filter(condition: (element) {
      return element.stateRegisterId == listPersonData.statePersonId;
    });
    return listPersonData;
  }

}
