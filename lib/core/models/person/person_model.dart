import 'package:jac/core/core.dart';

class PersonModel {
  String nameLastname;
  String documentNumber;
  TypeDocumentModel? typeDocumentModel;
  String? id;

  PersonModel({
    required this.nameLastname,
    required this.documentNumber,
    this.id
  });
}