import 'package:jac/core/cache/cache.dart';
import 'package:jac/core/core.dart';

abstract class PreregisterPersonCreateNewPersonUseCase {
  Future<bool> invoke();
}

class PreregisterPersonCreateNewPersonUseCaseImpl extends PreregisterPersonCreateNewPersonUseCase {

  @override
  Future<bool> invoke() async {
    await Future.delayed(const Duration(seconds: 2));
    PersonModel person = PersonModel(
      cellPhone: "",
      documentNumber: "",
      nameLastname: "",
    );
    return HandlerCache.addOrUpdateCache(cachesKey: CachesKey.preRegister, obj: person);
  }

}