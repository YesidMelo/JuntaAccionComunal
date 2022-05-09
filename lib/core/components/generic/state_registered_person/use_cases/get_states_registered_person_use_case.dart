import 'package:jac/core/core.dart';

abstract class GetStatesRegisteredUseCase {
  Future<List<StateRegisteredPersonModel>> invoke();
}

class GetStatesRegisteredUseCaseImpl extends GetStatesRegisteredUseCase {

  @override
  Future<List<StateRegisteredPersonModel>> invoke() async{
    return <StateRegisteredPersonModel>[];
  }

}