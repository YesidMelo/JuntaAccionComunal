import 'package:jac/core/core.dart';
import 'package:jac/di/di.dart';

abstract class GetPersonsUseCase {
  Future<List<PersonModel>> invoke();
}

class GetPersonsUseCaseImpl extends GetPersonsUseCase {

  final ListPersonRepository _listPersonRepository = getIt<ListPersonRepository>();

  @override
  Future<List<PersonModel>> invoke() async {
    return await _listPersonRepository.getListPersons();
  }

}