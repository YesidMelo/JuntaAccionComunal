import 'package:jac/core/exceptions/person/common_person.dart';

class PreregisterPersonCoreException extends PersonCoreException {PreregisterPersonCoreException({required String cause}) : super(cause: cause);}

class ListTypeDocumentEmptyException extends PreregisterPersonCoreException { ListTypeDocumentEmptyException() : super(cause: "the list type document is empty");}
class ListTypeInhabitantEmptyException extends PreregisterPersonCoreException { ListTypeInhabitantEmptyException() : super(cause: "the list type inhabitants is empty");}

class PersonPreregisteredFailed extends PreregisterPersonCoreException { PersonPreregisteredFailed() : super(cause: "the cellphone not is a number");}
