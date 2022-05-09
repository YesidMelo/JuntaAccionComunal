import 'package:jac/core/components/components.dart';
import 'package:jac/core/models/models.dart';
import 'package:jac/di/di.dart';

abstract class TypeInhabitantRepository {
  Future<List<TypeInhabitantModel>> getListTypeInhabitants();
}

class TypeInhabitantRepositoryImpl extends TypeInhabitantRepository {

  final TypeInhabitantRemoteSource _remoteSource = getIt<TypeInhabitantRemoteSource>();

  @override
  Future<List<TypeInhabitantModel>> getListTypeInhabitants() async {
    return await _remoteSource.getListTypeInhabitants();
  }

}