import 'package:jac/core/exceptions/exceptions.dart';
import 'package:jac/core/models/common/common.dart';
import 'package:jac/datasource/datasource.dart';

extension CloudFirestoreResponse on CloudFirestoreResponseDTO {

  TypeDocumentModel getTypeDocumentModel(){
    if(detailModel == null) throw WithoutDataFirebase();
    return TypeDocumentModel(id: detailModel!["id"], name: detailModel!["nombre"]);
  }

}

extension ListCloudFirestoreResponse on List<CloudFirestoreResponseDTO> {

  List<TypeDocumentModel> getListTypeDocumentModel(){
    return map((current) => current.getTypeDocumentModel()).toList();
  }
}