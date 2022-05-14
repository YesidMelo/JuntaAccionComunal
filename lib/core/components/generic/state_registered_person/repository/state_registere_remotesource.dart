import 'package:jac/core/models/models.dart';

abstract class StateRegisteredRemoteSource {
  Future<List<StateRegisteredPersonModel>> getListStatesRegistered();
}

class StateRegisteredRemoteSourceImpl extends StateRegisteredRemoteSource {

  @override
  Future<List<StateRegisteredPersonModel>> getListStatesRegistered() async {
    return <StateRegisteredPersonModel>[];
  }

}