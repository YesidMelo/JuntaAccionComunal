class CloudFirestoreResponseDTO {

  bool isSuccess;
  Map<String, dynamic>? detailModel;
  String? error;

  CloudFirestoreResponseDTO({
    required this.isSuccess,
    required this.detailModel,
    this.error
  });
}