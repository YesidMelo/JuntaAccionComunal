import 'package:jac/core/exceptions/core_exception.dart';

class PreregisterPersonCoreException extends CoreException {PreregisterPersonCoreException({required String cause}) : super(cause: cause);}

class PersonModelNullException extends PreregisterPersonCoreException { PersonModelNullException() : super(cause: "the Person model is null");}
class ListTypeDocumentEmptyException extends PreregisterPersonCoreException { ListTypeDocumentEmptyException() : super(cause: "the list type document is empty");}
class ListTypeInhabitantEmptyException extends PreregisterPersonCoreException { ListTypeInhabitantEmptyException() : super(cause: "the list type inhabitants is empty");}

class NameAndLastNameEmptyException extends PreregisterPersonCoreException { NameAndLastNameEmptyException() : super(cause: "the name and lastname is empty");}
class NameAndLastNameLengthException extends PreregisterPersonCoreException { NameAndLastNameLengthException() : super(cause: "the name and lastname not has length valid");}
class NumberDocumentationEmptyException extends PreregisterPersonCoreException { NumberDocumentationEmptyException() : super(cause: "the number documentation is empty");}
class NumberDocumentationLengthException extends PreregisterPersonCoreException { NumberDocumentationLengthException() : super(cause: "the number documentation length invalid");}