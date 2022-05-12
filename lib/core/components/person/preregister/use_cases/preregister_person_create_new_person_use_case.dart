import 'package:jac/core/cache/cache.dart';
import 'package:jac/core/core.dart';
import 'package:jac/core/models/person/person_direction_model.dart';

abstract class PreregisterPersonCreateNewPersonUseCase {
  Future<bool> invoke();
}

class PreregisterPersonCreateNewPersonUseCaseImpl extends PreregisterPersonCreateNewPersonUseCase {

  @override
  Future<bool> invoke() async {
    await Future.delayed(const Duration(seconds: 2));
    PersonModel person = PersonModel(
      cellPhone: "3106607080",
      documentNumber: "123456",
      nameLastname: "Nombre prueba",
    );
    person.direction = PersonDirectionModel(name: "calle 58 c 71");
    return HandlerCache.addOrUpdateCache(cachesKey: CachesKey.preRegister, obj: person);
  }

}