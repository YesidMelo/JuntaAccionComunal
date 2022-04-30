part of 'preregister_person_bloc.dart';

abstract class PreregisterPersonPageEvent{
  PersonModel? currentPerson;
}

class PreregisterPersonPageLoadEvent  extends PreregisterPersonPageEvent{
  final PreregisterPersonGetCurrentPersonUseCase _getCurrentPersonUseCase = getIt<PreregisterPersonGetCurrentPersonUseCase>();
  Future<PersonModel> loadElements() async {
    return await _getCurrentPersonUseCase.invoke();
  }
}

class PreregisterPersonPageUpdatePersonEvent extends PreregisterPersonPageEvent {}

class PreregisterPersonPageSendPersonEvent extends PreregisterPersonPageEvent{}