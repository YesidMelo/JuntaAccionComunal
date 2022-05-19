import 'package:jac/core/core.dart';
import 'package:jac/datasource/datasource.dart';
import 'package:jac/di/di.dart';
import 'package:jac/core/components/generic/state_registered_person/mapper/mapper.dart';

abstract class StateRegisteredRemoteSource {
  Future<List<StateRegisteredPersonModel>> getListStatesRegistered();
}

class StateRegisteredRemoteSourceImpl extends StateRegisteredRemoteSource {

  final HandlerFirestore _handlerFirestore = getIt<HandlerFirestore>();

  @override
  Future<List<StateRegisteredPersonModel>> getListStatesRegistered() async {
    try {
      List<CloudFirestoreResponseDTO> listresponse = await _handlerFirestore
        .getListCollection(cloudFirestoreRequestDTO: CloudFirestoreRequestDTO(
          nameCollection: CollectionsFirebase.statesRegisterPerson.getName(),
          mapOfModel: <String, dynamic>{}
        )
      );

      return listresponse.getListStateRegisteredPersonModel();
    } on CloudFirestoreExceptionFirestoreNotConnectionInternet {
      throw NotConnectionInternetException();
    }
  }

}