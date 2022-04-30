class PersonModel {
  String nameLastname;
  String documentNumber;
  String? id;

  PersonModel({
    required this.nameLastname,
    required this.documentNumber,
    this.id
  });
}