import 'package:jac/core/core.dart';
import 'package:jac/core/models/person/person_direction_model.dart';

class PersonModel {
  String nameLastname;
  String documentNumber;
  String cellPhone;
  TypeDocumentModel? typeDocument;
  PersonDirectionModel? direction;
  String? id;
  String? stateRegisterId;

  PersonModel({
    required this.cellPhone,
    required this.documentNumber,
    required this.nameLastname,
    this.id,
    this.stateRegisterId = Constants.idPreregistered,
  });

  PersonModel copyWith({
    String? nameLastName,
    String? documentNumber,
    String? cellPhone,
    PersonDirectionModel? personDirectionModel
  }) {
    PersonModel personModel = PersonModel(
      cellPhone: cellPhone ?? this.cellPhone,
      documentNumber: documentNumber ?? this.documentNumber,
      nameLastname: nameLastName ?? nameLastname
    );
    personModel.direction = personDirectionModel;
    personModel.id = id;
    personModel.stateRegisterId = stateRegisterId;
    personModel.typeDocument = typeDocument;
    return personModel;
  }

}