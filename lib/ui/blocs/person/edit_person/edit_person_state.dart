part of 'edit_person_bloc.dart';

abstract class EditPersonState extends BaseStateBloc {
  EditPersonBlocData data;
  EditPersonState({
    required this.data,
    CoreException? e,
    bool showProgress = false,
    bool showDialog = false,
  }): super(
    e: e,
    showProgress: showProgress,
    showDialog: showDialog
  );
}

class EditPersonInitialState extends EditPersonState {
  EditPersonInitialState() : super(data: EditPersonBlocData());
}

class EditPersonLoadingState extends EditPersonState {
  EditPersonLoadingState({required EditPersonBlocData data}) : super(data: data, showProgress: true);
}

class EditPersonLoadedState extends EditPersonState {
  EditPersonLoadedState({required EditPersonBlocData data}) : super(data: data, showProgress: false);
}

class EditPersonChangeInformationState extends EditPersonState {
  EditPersonChangeInformationState({required EditPersonBlocData data}) : super(data: data, showProgress: false);
}

class EditPersonSendInformationFailedState extends EditPersonState {
  EditPersonSendInformationFailedState({
    required EditPersonBlocData data,
    required CoreException e,
    bool showDialog = false
  }) : super(data: data, e: e, showProgress: false, showDialog: showDialog);
}

class EditPersonSendedState extends EditPersonState {
  EditPersonSendedState({required EditPersonBlocData data}) : super(data: data, showProgress: false);
}