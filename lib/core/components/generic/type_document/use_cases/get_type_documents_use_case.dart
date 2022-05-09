import 'package:jac/core/core.dart';
import 'package:jac/di/di.dart';

abstract class GetTypeDocumentUseCase {
  Future<List<TypeDocumentModel>> invoke();
}

class GetTypeDocumentUseCaseImpl extends GetTypeDocumentUseCase {
  final TypeDocumentRepository _typeDocumentRepository = getIt<TypeDocumentRepository>();
  @override
  Future<List<TypeDocumentModel>> invoke() async {
    List<TypeDocumentModel> listModels = await _typeDocumentRepository.invoke();
    if(listModels.isEmpty) throw ListTypeDocumentEmptyException();
    return listModels;
  }
}