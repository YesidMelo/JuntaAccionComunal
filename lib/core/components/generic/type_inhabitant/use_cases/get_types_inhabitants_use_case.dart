import 'package:jac/core/components/components.dart';
import 'package:jac/core/exceptions/exceptions.dart';
import 'package:jac/core/models/common/common.dart';
import 'package:jac/di/di.dart';

abstract class GetTypeInhabitantsUseCase {
  Future<List<TypeInhabitantModel>> invoke();
}

class GetTypeInhabitantsUseCaseImpl extends GetTypeInhabitantsUseCase {

  final TypeInhabitantRepository _inhabitantRepository = getIt<TypeInhabitantRepository>();

  @override
  Future<List<TypeInhabitantModel>> invoke() async {
    List<TypeInhabitantModel> list = await _inhabitantRepository.getListTypeInhabitants();

    if(list.isEmpty) {
      throw ListTypeInhabitantEmptyException();
    }
    return list;
  }

}