import 'package:jac/core/components/generic/type_inhabitant/mappers/mappers.dart';
import 'package:jac/core/exceptions/exceptions.dart';
import 'package:jac/core/models/models.dart';
import 'package:jac/core/utils/firebase/firebase.dart';
import 'package:jac/datasource/datasource.dart';
import 'package:jac/di/di.dart';

abstract class TypeInhabitantRemoteSource {
  Future<List<TypeInhabitantModel>> getListTypeInhabitants();
}

class TypeInhabitantRemoteSourceImpl extends TypeInhabitantRemoteSource {

  final HandlerFirestore _handlerFirestore = getIt<HandlerFirestore>();

  @override
  Future<List<TypeInhabitantModel>> getListTypeInhabitants() async {
    try{
      return (await _handlerFirestore
          .getListCollection(
          cloudFirestoreRequestDTO: CloudFirestoreRequestDTO(
              nameCollection: CollectionsFirebase.typeInhabitants.getName(),
              mapOfModel: <String, dynamic>{}
          )
      )
      ).toListTypeInhabitantModel();
    } on CloudFirestoreExceptionFirestoreNotConnectionInternet catch(e, stacktrace) {
      print(stacktrace.toString());
      throw NotConnectionInternetException();
    }
  }

}