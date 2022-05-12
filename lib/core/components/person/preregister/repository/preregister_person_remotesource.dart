import 'package:jac/core/models/models.dart';
import 'package:jac/datasource/datasource.dart';
import 'package:jac/di/di.dart';
import 'package:jac/core/components/person/preregister/mappers/mappers.dart';

abstract class PreregisterPersonRemotesource {
  Future<bool> preregisterPerson({required PersonModel personModel});
}

class PreregisterPersonRemotesourceImpl extends PreregisterPersonRemotesource {

  final HandlerFirestore _handlerFirestore = getIt<HandlerFirestore>();


  @override
  Future<bool> preregisterPerson({required PersonModel personModel}) async {
    //CloudFirestoreResponseDTO? responseDTO = await _handlerFirestore.addOrUpdateObject(cloudFirestoreRequestDTO: personModel.toCloudFirestoreRequestDTO());
    //return responseDTO != null;
    await Future.delayed(const Duration(seconds: 10));
    return true;
  }
}