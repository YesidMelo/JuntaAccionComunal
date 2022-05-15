part of 'list_person_bloc.dart';

abstract class ListPersonEvent {
  ListPersonData listPersonData;
  ListPersonEvent({
    required this.listPersonData
  });

}

class ListPersonLoadEvent extends ListPersonEvent {

  final GetPersonsUseCase _getPersonsUseCase = getIt<GetPersonsUseCase>();

  ListPersonLoadEvent() : super(listPersonData: ListPersonData());

  Future<ListPersonData> loadElements() async {
    ListPersonData data = ListPersonData();
    data.listPersons = await _getPersonsUseCase.invoke();
    return data;
  }
}
