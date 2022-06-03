import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';
import 'base_message_exceptions.dart';

abstract class HandlerCommonPersonException extends BaseMessageExceptions {

  static BaseMessageExceptions getPersonCommonException({required CoreException exception}){
    return HandlerPersonModelNullException();
  }
}

class HandlerPersonModelNullException extends HandlerCommonPersonException {

  @override
  VoidCallback getOk() => () { print("Enviando evento a analitics"); };

  @override
  Worlds getMessage() => Worlds.failedLoadForm;

  @override
  Worlds getTitle() => Worlds.error;

}