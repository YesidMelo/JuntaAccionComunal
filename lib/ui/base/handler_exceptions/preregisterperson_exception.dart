import 'package:jac/core/core.dart';
import 'package:jac/ui/base/handler_exceptions/handler_exceptions.dart';
import 'package:jac/ui/language/worlds_languages.dart';

abstract class PreregisterPersonException extends BaseMessageExceptions {

  static PreregisterPersonException getDetailException({required CoreException exception}) {
    if(exception is PersonModelNullException) return HandlerPersonModelNullException();
    if(exception is ListTypeDocumentEmptyException) return HandlerListTypeDocumentEmptyException();
    if(exception is ListTypeInhabitantEmptyException) return HandlerListTypeInhabitantEmptyException();
    if(exception is PersonPreregisteredFailed) return HandlerPersonPreregisteredFailed();
    return HandlerPreregisterPersonExceptionGeneric();
  }

}

class HandlerPersonModelNullException extends PreregisterPersonException {

  @override
  Function getOk() => () { print("Enviando evento a analitics"); };

  @override
  Worlds getMessage() => Worlds.preregisterFailedLoadForm;

  @override
  Worlds getTitle() => Worlds.preregister;

}

class HandlerListTypeDocumentEmptyException extends PreregisterPersonException {
  @override
  Worlds getMessage() => Worlds.preregisterFailedLoadForm;

  @override
  Function getOk() => (){print("enviando a analytics");};

  @override
  Worlds getTitle() => Worlds.preregister;
}

class HandlerListTypeInhabitantEmptyException extends PreregisterPersonException {
  @override
  Worlds getMessage() => Worlds.preregisterFailedLoadForm;

  @override
  Function getOk() => (){print("enviando a analytics");};

  @override
  Worlds getTitle() => Worlds.preregister;
}

class HandlerPreregisterPersonExceptionGeneric extends PreregisterPersonException {
  @override
  Worlds getMessage() => Worlds.preregisterFailedLoadForm;

  @override
  Function getOk() => (){print("enviando a analytics");};

  @override
  Worlds getTitle() => Worlds.preregister;
}

class HandlerPersonPreregisteredFailed extends PreregisterPersonException {
  @override
  Worlds getMessage() => Worlds.preregisterFailedRegisterPerson;

  @override
  Function getOk() => (){print("enviando a analytics");};

  @override
  Worlds getTitle() => Worlds.preregister;
}
