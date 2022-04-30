import 'package:jac/core/cache/cache.dart';
import 'package:jac/core/core.dart';
import 'package:jac/core/exceptions/person/preregister_person.dart';

abstract class PreregisterPersonGetCurrentPersonUseCase {
  Future<PersonModel> invoke();
}

class PreregisterPersonGetCurrentPersonUseCaseImpl extends PreregisterPersonGetCurrentPersonUseCase {

  @override
  Future<PersonModel> invoke() async {
    PersonModel? personModel = HandlerCache.getElement(cachesKey: CachesKey.preRegister);
    if(personModel == null) throw PersonModelNull();
    return personModel;
  }

}