import 'package:jac/core/core.dart';
import 'package:jac/core/models/person/person_direction_model.dart';
import 'package:jac/datasource/datasource.dart';

extension PersonModelExtention on CloudFirestoreResponseDTO {
  PersonModel getPersonModel() {
    if(detailModel == null) throw WithoutDataFirebaseException();
    PersonModel model = PersonModel(
      nameLastname: detailModel?["nameLastname"],
      documentNumber: detailModel?["documentNumber"],
      cellPhone: detailModel?["cellPhone"],
      id: detailModel?["id"],
      stateRegisterId: detailModel?["stateRegistered"],
    );

    model.stateRegisterId = detailModel?["stateRegistered"];
    model.direction = (detailModel?["direction"] as Map<String, dynamic>).getDirection();
    model.typeDocument = TypeDocumentModel(id: detailModel?["typeDocument"], name: "");
    return model;
  }
}

extension ListPersonModelExtension on List<CloudFirestoreResponseDTO> {

  List<PersonModel> getListPersonModel() {
    return map(
      (e) => e.getPersonModel()
    ).toList();
  }

}

extension MapToDirectionPersonModel on Map<String, dynamic> {
  PersonDirectionModel getDirection() {
    return PersonDirectionModel(name: this["name"] as String);
  }
}