import 'package:jac/core/exceptions/core_exception.dart';

class PersonModelNullException extends CoreException { PersonModelNullException() : super(cause: "the Person model is null");}
class ListTypeDocumentEmptyException extends CoreException { ListTypeDocumentEmptyException() : super(cause: "the list type document is empty");}
class ListTypeInhabitantEmptyException extends CoreException { ListTypeInhabitantEmptyException() : super(cause: "the list type inhabitants is empty");}

class NameAndLastNameEmptyException extends CoreException { NameAndLastNameEmptyException() : super(cause: "the name and lastname is empty");}
class NameAndLastNameLengthException extends CoreException { NameAndLastNameLengthException() : super(cause: "the name and lastname not has length valid");}
class NumberDocumentationEmptyException extends CoreException { NumberDocumentationEmptyException() : super(cause: "the number documentation is empty");}
class NumberDocumentationLengthException extends CoreException { NumberDocumentationLengthException() : super(cause: "the number documentation length invalid");}