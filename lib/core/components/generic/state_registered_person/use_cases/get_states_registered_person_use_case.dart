import 'package:jac/core/core.dart';
import 'package:jac/di/di.dart';

abstract class GetStatesRegisteredUseCase {
  Future<List<StateRegisteredPersonModel>> invoke();
}

class GetStatesRegisteredUseCaseImpl extends GetStatesRegisteredUseCase {

  final StateRegisteredRepository _stateRegisteredRepository = getIt<StateRegisteredRepository>();

  @override
  Future<List<StateRegisteredPersonModel>> invoke() async{
    return await _stateRegisteredRepository.getListStatesRegistered();
  }

}