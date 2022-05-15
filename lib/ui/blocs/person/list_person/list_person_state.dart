part of 'list_person_bloc.dart';

abstract class ListPersonState extends BaseStateBloc {

  List<PersonModel> listPersons = <PersonModel>[];
  List<PersonModel> listPersonsFiltered = <PersonModel>[];

  ListPersonState({
    required this.listPersons,
    required this.listPersonsFiltered,
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
  );
}

class ListPersonLoadingState extends ListPersonState {

  ListPersonLoadingState({
    required List<PersonModel> listPersons,
    required List<PersonModel> listPersonsFiltered,
  }) : super(
    listPersons: listPersons,
    listPersonsFiltered: listPersonsFiltered,
    showProgress: true
  );

}

class ListPersonLoadedState extends ListPersonState {

  ListPersonLoadedState({
    required List<PersonModel> listPersons,
    required List<PersonModel> listPersonsFiltered,
  }) : super(
    listPersons: listPersons,
    listPersonsFiltered: listPersonsFiltered,
    showProgress: false
  );

}