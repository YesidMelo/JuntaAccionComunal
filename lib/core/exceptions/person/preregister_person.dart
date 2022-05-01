import 'package:jac/core/exceptions/core_exception.dart';

class PersonModelNullException extends CoreException { PersonModelNullException() : super(cause: "the Person model is null");}
class ListTypeDocumentEmptyException extends CoreException { ListTypeDocumentEmptyException() : super(cause: "the list type document is empty");}