import 'package:jac/core/core.dart';
import 'package:jac/ui/base/handler_exceptions/handler_exceptions.dart';
import 'package:jac/ui/common_ui.dart';

abstract class BaseMessageExceptions {
  Worlds getTitle();
  Worlds getMessage();
  Function getOk();

  static BaseMessageExceptions getDetailException({required CoreException coreException}) {
    if(coreException is PreregisterPersonCoreException) return PreregisterPersonException.getDetailException(exception: coreException);
    return HandlerCoreException();
  }
}

class HandlerCoreException extends BaseMessageExceptions {

  @override
  Worlds getMessage() => Worlds.unExpectedProblemTryAgain;

  @override
  Function getOk() => () {
    print("enviando a analytics");
  };

  @override
  Worlds getTitle() => Worlds.unExpectedProblem;

}