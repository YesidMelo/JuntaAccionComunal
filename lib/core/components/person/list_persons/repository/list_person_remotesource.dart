import 'package:jac/core/core.dart';
import 'package:jac/datasource/datasource.dart';
import 'package:jac/di/di.dart';
import 'package:jac/core/components/person/list_persons/mapper/mapper.dart';

abstract class ListPersonRemoteSource {
  Future<List<PersonModel>> getListPersons();
}

class ListPersonRemoteSourceImpl extends ListPersonRemoteSource {
  final HandlerFirestore _handlerFirestore = getIt<HandlerFirestore>();
  @override
  Future<List<PersonModel>> getListPersons() async {

    try {
      List<CloudFirestoreResponseDTO> listResponse = await _handlerFirestore.getListCollection(
          cloudFirestoreRequestDTO: CloudFirestoreRequestDTO(
            nameCollection: CollectionsFirebase.person.getName(),
            mapOfModel: <String, dynamic>{}
          )
      );
      return listResponse.getListPersonModel();
    }on CloudFirestoreExceptionFirestoreNotConnectionInternet {
      throw NotConnectionInternetException();
    }
  }
}