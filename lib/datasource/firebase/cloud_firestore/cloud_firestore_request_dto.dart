class CloudFirestoreRequestDTO {

  String nameCollection;
  String? idElementCollection;
  Map<String, dynamic> mapOfModel;

  CloudFirestoreRequestDTO({
    required this.nameCollection,
    required this.mapOfModel,
    this.idElementCollection
  });
}