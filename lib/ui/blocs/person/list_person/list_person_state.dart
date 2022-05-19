part of 'list_person_bloc.dart';

abstract class ListPersonState extends BaseStateBloc {

  List<PersonModel> listPersons = <PersonModel>[];
  List<PersonModel> listPersonsFiltered = <PersonModel>[];
  List<StateRegisteredPersonModel> listStatePersonList = <StateRegisteredPersonModel>[];
  StateRegisteredPersonModel? filterStateRegisteredSelected;

  ListPersonState({
    required this.listPersons,
    required this.listPersonsFiltered,
    required this.listStatePersonList,
    this.filterStateRegisteredSelected,
    CoreException? e,
    bool showDialog = false,
    bool showProgress = false,
  }): super(
    e: e,
    showProgress: showProgress,
    showDialog: showDialog
  );

}

class ListPersonInitState extends ListPersonState {
  ListPersonInitState() : super(
    listPersons: <PersonModel>[],
    listPersonsFiltered: <PersonModel>[],
    listStatePersonList: <StateRegisteredPersonModel>[],
  );
}

class ListPersonLoadingState extends ListPersonState {

  ListPersonLoadingState({
    required List<PersonModel> listPersons,
    required List<PersonModel> listPersonsFiltered,
    required List<StateRegisteredPersonModel> listStateRegisteredPerson,
  }) : super(
    listPersons: listPersons,
    listPersonsFiltered: listPersonsFiltered,
    listStatePersonList: listStateRegisteredPerson,
    showProgress: true
  );

}

class ListPersonLoadedState extends ListPersonState {

  ListPersonLoadedState({
    required List<PersonModel> listPersons,
    required List<PersonModel> listPersonsFiltered,
    required List<StateRegisteredPersonModel> listStateRegisteredPerson,
    required StateRegisteredPersonModel? stateSelected,
  }) : super(
    listPersons: listPersons,
    listPersonsFiltered: listPersonsFiltered,
    listStatePersonList: listStateRegisteredPerson,
    filterStateRegisteredSelected: stateSelected,
    showProgress: false
  );

}