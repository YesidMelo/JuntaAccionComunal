part of 'list_person_bloc.dart';

abstract class ListPersonState extends BaseStateBloc {
  ListPersonData listPersonData;

  ListPersonState({
    required this.listPersonData,
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
  ListPersonInitState() : super(listPersonData: ListPersonData());
}

class ListPersonLoadingState extends ListPersonState {

  ListPersonLoadingState({
    required ListPersonData listPersonData
  }) : super(
    listPersonData: listPersonData,
    showProgress: true
  );

}

class ListPersonLoadedState extends ListPersonState {
  ListPersonLoadedState({
    required ListPersonData listPersonData
  }) : super(
    listPersonData: listPersonData,
    showProgress: false
  );

}

class ListPersonFilteredState extends ListPersonState {
  ListPersonFilteredState({
    required ListPersonData listPersonData
  }) : super(
    listPersonData: listPersonData,
    showProgress: false
  );

}