part of 'preregister_person_bloc.dart';

abstract class PreregisterPersonPageState {
  PersonModel? currentPerson;
}

class PreregisterPersonPageInitState extends PreregisterPersonPageState{}

class PreregisterPersonPageLoadingState extends PreregisterPersonPageState{}
class PreregisterPersonPageLoadedState extends PreregisterPersonPageState{}
class PreregisterPersonPageUpdatePersonState extends PreregisterPersonPageState{}
class PreregisterPersonPageSendPersonState extends PreregisterPersonPageState{}
class PreregisterPersonPageSuccessState extends PreregisterPersonPageState{}

class PreregisterPersonPageErrorState extends PreregisterPersonPageState{
  Exception e;

  PreregisterPersonPageErrorState({
    required this.e
  }): super();
}