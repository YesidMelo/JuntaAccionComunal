import 'package:jac/core/core.dart';
import 'package:jac/core/models/person/person_direction_model.dart';

class PersonModel {
  String nameLastname;
  String documentNumber;
  String cellPhone;
  TypeDocumentModel? typeDocument;
  PersonDirectionModel? direction;
  String? id;


  PersonModel({
    required this.nameLastname,
    required this.documentNumber,
    required this.cellPhone,
    this.id
  });
}