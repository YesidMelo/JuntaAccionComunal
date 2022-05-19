import 'package:jac/core/exceptions/exceptions.dart';
import 'package:jac/core/models/models.dart';
import 'package:jac/datasource/datasource.dart';

extension CloudFirestoreResponseListMapper on List<CloudFirestoreResponseDTO> {

  List<StateRegisteredPersonModel> getListStateRegisteredPersonModel() {
    return map((current) => current.getStateRegisteredPersonModel()).toList();
  }
}

extension CloudFirestoreResponseMapper on CloudFirestoreResponseDTO {

  StateRegisteredPersonModel getStateRegisteredPersonModel() {
    if(detailModel == null) throw WithoutDataFirebaseException();
    return StateRegisteredPersonModel(
      id: detailModel!["id"],
      name: detailModel!["nombre"]
    );
  }
}