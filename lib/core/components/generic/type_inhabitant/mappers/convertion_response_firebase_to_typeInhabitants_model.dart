import 'package:jac/core/core.dart';
import 'package:jac/datasource/datasource.dart';

extension CloudFirestoreResponeDTOMapper on CloudFirestoreResponseDTO {

  TypeInhabitantModel toTypeInhabitantModel() {
    if(detailModel == null) throw WithoutDataFirebaseException();
    return TypeInhabitantModel(id: detailModel!["id"], name: detailModel!["nombre"]);
  }

}

extension ListCloudFirestoreResponeDTOMapper on List<CloudFirestoreResponseDTO> {

  List<TypeInhabitantModel> toListTypeInhabitantModel() {
    return map((e) => e.toTypeInhabitantModel()).toList();
  }

}
