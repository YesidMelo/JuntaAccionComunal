import 'package:jac/core/core.dart';
import 'package:jac/di/di.dart';

abstract class PreregisterPersonSendPersonUseCase {
  Future<bool> invoke({required PersonModel personModel});
}

class PreregisterPersonSendPersonUseCaseImpl extends PreregisterPersonSendPersonUseCase {

  final PreregisterPersonRepository _personRepository = getIt<PreregisterPersonRepository>();

  @override
  Future<bool> invoke({required PersonModel personModel}) async {
    return _personRepository.preregisterPerson(personModel: personModel);
  }

}