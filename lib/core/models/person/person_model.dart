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
}