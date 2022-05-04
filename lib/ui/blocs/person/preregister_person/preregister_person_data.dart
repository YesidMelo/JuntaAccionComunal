import 'package:jac/core/core.dart';

class PreregisterPersonDataLoad {

  List<TypeDocumentModel> listTypeDocuments = <TypeDocumentModel>[];
  List<TypeInhabitantModel> listInhabitant = <TypeInhabitantModel>[];
  PersonModel? personModel;

  PreregisterPersonDataLoad({
    required this.listInhabitant,
    required this.listTypeDocuments,
    required this.personModel,
  });
}