import 'package:jac/core/models/models.dart';
import 'package:jac/di/di.dart';
import 'package:jac/core/components/person/list_persons/repository/list_person_remotesource.dart';

abstract class ListPersonRepository {
  Future<List<PersonModel>> getListPersons();
}

class ListPersonRepositoryImpl extends ListPersonRepository {

  final ListPersonRemoteSource _listPersonRemoteSource = getIt<ListPersonRemoteSource>();

  @override
  Future<List<PersonModel>> getListPersons() async {
    return await _listPersonRemoteSource.getListPersons();
  }
}