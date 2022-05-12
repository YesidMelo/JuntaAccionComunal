import 'package:jac/core/core.dart';
import 'package:jac/datasource/datasource.dart';
import 'package:jac/datasource/firebase/cloud_firestore/cloud_firestore_exceptions.dart';
import 'package:jac/di/di.dart';

abstract class TypeDocumentRemoteSource {
  Future<List<TypeDocumentModel>> loadTypeDocuments();
}

class TypeDocumentRemoteSourceImpl extends TypeDocumentRemoteSource {

  final HandlerFirestore _handlerFirestore = getIt<HandlerFirestore>();

  @override
  Future<List<TypeDocumentModel>> loadTypeDocuments() async {
    try {
      return (await _handlerFirestore.getListCollection(
          cloudFirestoreRequestDTO: CloudFirestoreRequestDTO(
              nameCollection: CollectionsFirebase.typeDocumentation.getName(),
              mapOfModel: <String,dynamic>{}
          )
      )).getListTypeDocumentModel();
    } on CloudFirestoreExceptionFirestoreNotConnectionInternet catch(e, stacktrace) {
      print(stacktrace.toString());
      throw NotConnectionInternetException();
    }

  }

}