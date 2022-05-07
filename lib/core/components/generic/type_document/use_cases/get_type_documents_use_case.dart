import 'package:jac/core/core.dart';

abstract class GetTypeDocumentUseCase {
  Future<List<TypeDocumentModel>> invoke();
}

class GetTypeDocumentUseCaseImpl extends GetTypeDocumentUseCase {

  @override
  Future<List<TypeDocumentModel>> invoke() async {
    List<TypeDocumentModel> listModels = <TypeDocumentModel>[];
    /*
    listModels.add(TypeDocumentModel(id: "", name: "cedula"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 1"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 2"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 3"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 4"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 5"));
    */
    if(listModels.isEmpty) throw ListTypeDocumentEmptyException();
    return listModels;
  }
}