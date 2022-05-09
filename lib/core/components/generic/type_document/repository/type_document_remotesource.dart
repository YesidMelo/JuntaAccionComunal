import 'package:jac/core/core.dart';
import 'package:jac/datasource/datasource.dart';
import 'package:jac/di/di.dart';

abstract class TypeDocumentRemoteSource {
  Future<List<TypeDocumentModel>> loadTypeDocuments();
}

class TypeDocumentRemoteSourceImpl extends TypeDocumentRemoteSource {

  final HandlerFirestore _handlerFirestore = getIt<HandlerFirestore>();

  @override
  Future<List<TypeDocumentModel>> loadTypeDocuments() async {
    return (await _handlerFirestore.getListCollection(
        cloudFirestoreRequestDTO: CloudFirestoreRequestDTO(
            nameCollection: CollectionsFirebase.typeDocumentation.getName(),
            mapOfModel: <String,dynamic>{}
        )
    )).getListTypeDocumentModel();
  }

}