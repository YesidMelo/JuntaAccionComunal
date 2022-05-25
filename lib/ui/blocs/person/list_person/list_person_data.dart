part of 'list_person_bloc.dart';

class ListPersonData {
  List<PersonModel> listPersons = <PersonModel>[];
  List<PersonModel> listPersonsFiltered = <PersonModel>[];
  List<StateRegisteredPersonModel> listStatePersonRegistered= <StateRegisteredPersonModel>[];
  StateRegisteredPersonModel? stateFiltered;
  String? statePersonId;
  bool showErrorEmptyListPersonFiltered = false;

  ListPersonData copyWith({
    List<PersonModel>? listPersons,
    List<PersonModel>? listPersonsFiltered,
    List<StateRegisteredPersonModel>? listStatePersonRegistered,
    StateRegisteredPersonModel? stateFiltered,
    String? statePersonId,
    bool? showErrorEmptyListPersonFiltered
  }){
    ListPersonData data = ListPersonData();
    data.listPersons = listPersons ?? this.listPersons;
    data.listPersonsFiltered = listPersonsFiltered ?? this.listPersonsFiltered;
    data.listStatePersonRegistered = listStatePersonRegistered ?? this.listStatePersonRegistered;
    data.stateFiltered = stateFiltered ?? this.stateFiltered;
    data.statePersonId = statePersonId ?? this.statePersonId;
    data.showErrorEmptyListPersonFiltered = showErrorEmptyListPersonFiltered ?? this.showErrorEmptyListPersonFiltered;
    return data;
  }
}