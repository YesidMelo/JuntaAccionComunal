import 'package:jac/core/models/models.dart';
import 'package:jac/di/di.dart';
import 'preregister_person_remotesource.dart';

abstract class PreregisterPersonRepository{
  Future<bool> preregisterPerson({required PersonModel personModel});
}

class PreregisterPersonRepositoryImpl extends PreregisterPersonRepository{

  final PreregisterPersonRemotesource _personRemotesource = getIt<PreregisterPersonRemotesource>();

  @override
  Future<bool> preregisterPerson({required PersonModel personModel}) async {
    return _personRemotesource.preregisterPerson(personModel: personModel);
  }

}