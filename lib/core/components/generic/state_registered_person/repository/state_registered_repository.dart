import 'package:jac/core/exceptions/exceptions.dart';
import 'package:jac/core/models/models.dart';
import 'package:jac/core/components/generic/state_registered_person/state_registered_person.dart';
import 'package:jac/datasource/datasource.dart';
import 'package:jac/di/di.dart';

abstract class StateRegisteredRepository {
  Future<List<StateRegisteredPersonModel>> getListStatesRegistered();
}

class StateRegisteredRepositorySourceImpl extends StateRegisteredRepository {

  final StateRegisteredRemoteSource _remoteSource = getIt<StateRegisteredRemoteSource>();

  @override
  Future<List<StateRegisteredPersonModel>> getListStatesRegistered() async {
    try {
      return await _remoteSource.getListStatesRegistered();
    } on CloudFirestoreExceptionFirestoreNotConnectionInternet catch(e, stacktrace) {
      print(stacktrace.toString());
      throw NotConnectionInternetException();
    }
  }

}