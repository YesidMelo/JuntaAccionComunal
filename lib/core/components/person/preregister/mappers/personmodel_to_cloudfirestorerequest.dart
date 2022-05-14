import 'package:jac/core/core.dart';
import 'package:jac/datasource/datasource.dart';
import 'person_direction_mapper.dart';

extension PersonModelMapper on PersonModel {
  CloudFirestoreRequestDTO toCloudFirestoreRequestDTO(){
    return CloudFirestoreRequestDTO(
      nameCollection: CollectionsFirebase.person.getName(),
      mapOfModel: <String, dynamic>{
        "nameLastname" : nameLastname,
        "documentNumber": documentNumber,
        "cellPhone": cellPhone,
        "id": id,
        "direction": direction?.toMap() ?? <String, dynamic>{},
        "typeDocument": typeDocument?.id,
        "stateRegistered" : stateRegisterId
      }
    );
  }
}



