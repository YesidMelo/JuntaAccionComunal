import 'package:jac/core/core.dart';

class PreregisterPersonDataLoad {

  List<StateRegisteredPersonModel> listStateRegistered = <StateRegisteredPersonModel>[];
  List<TypeDocumentModel> listTypeDocuments = <TypeDocumentModel>[];
  List<TypeInhabitantModel> listInhabitant = <TypeInhabitantModel>[];
  PersonModel? personModel;

  PreregisterPersonDataLoad({
    required this.listInhabitant,
    required this.listStateRegistered,
    required this.listTypeDocuments,
    required this.personModel,
  });
}