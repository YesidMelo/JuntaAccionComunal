import 'package:jac/core/core.dart';
import 'package:jac/ui/base/handler_exceptions/commonperson_exception.dart';
import 'package:jac/ui/base/handler_exceptions/handler_exceptions.dart';
import 'package:jac/ui/common_ui.dart';

abstract class BaseMessageExceptions {
  Worlds getTitle();
  Worlds getMessage();
  VoidCallback getOk();

  static BaseMessageExceptions getDetailException({required CoreException coreException}) {
    if(coreException is PersonCoreException) return HandlerCommonPersonException.getPersonCommonException(exception: coreException);
    if(coreException is PreregisterPersonCoreException) return PreregisterPersonException.getDetailException(exception: coreException);
    if(coreException is NotConnectionInternetException) return HandlerNotInternetException();
    return HandlerCoreException();
  }
}

class HandlerCoreException extends BaseMessageExceptions {

  @override
  Worlds getMessage() => Worlds.unExpectedProblemTryAgain;

  @override
  VoidCallback getOk() => () {
    print("enviando a analytics");
  };

  @override
  Worlds getTitle() => Worlds.unExpectedProblem;

}

class HandlerNotInternetException extends BaseMessageExceptions {

  @override
  Worlds getMessage() => Worlds.withoutInternet;

  @override
  VoidCallback getOk() => () {
    print("enviando a analytics");
  };

  @override
  Worlds getTitle() => Worlds.unExpectedProblem;

}