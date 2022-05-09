import 'package:jac/core/core.dart';
import 'package:jac/di/di.dart';

abstract class TypeDocumentRepository {
  Future<List<TypeDocumentModel>> invoke();
}

class TypeDocumentRepositoryImpl extends TypeDocumentRepository {

  final TypeDocumentRemoteSource _remoteSource = getIt<TypeDocumentRemoteSource>();

  @override
  Future<List<TypeDocumentModel>> invoke() async {
    List<TypeDocumentModel> listModels = await _remoteSource.invoke();
    return listModels;
  }

}