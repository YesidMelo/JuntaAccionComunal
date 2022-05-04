import 'package:jac/core/exceptions/exceptions.dart';
import 'package:jac/core/models/common/common.dart';

abstract class GetTypeInhabitantsUseCase {
  Future<List<TypeInhabitantModel>> invoke();
}

class GetTypeInhabitantsUseCaseImpl extends GetTypeInhabitantsUseCase {

  @override
  Future<List<TypeInhabitantModel>> invoke() async {
    List<TypeInhabitantModel> list = <TypeInhabitantModel>[];

    list
      ..add(TypeInhabitantModel(id: "a", name: "Propietario"))
      ..add(TypeInhabitantModel(id: "b", name: "Arrendatario"))
    ;

    if(list.isEmpty) {
      throw ListTypeInhabitantEmptyException();
    }
    return list;
  }

}