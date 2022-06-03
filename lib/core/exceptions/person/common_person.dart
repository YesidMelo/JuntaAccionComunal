import 'package:jac/core/core.dart';

abstract class PersonCoreException extends CoreException  {PersonCoreException({required String cause}) : super(cause: cause);}

class PersonModelNullException extends PersonCoreException { PersonModelNullException() : super(cause: "the Person model is null");}

class NameAndLastNameEmptyException extends PersonCoreException { NameAndLastNameEmptyException() : super(cause: "the name and lastname is empty");}
class NameAndLastNameLengthException extends PersonCoreException { NameAndLastNameLengthException() : super(cause: "the name and lastname not has length valid");}
class NumberDocumentationEmptyException extends PersonCoreException { NumberDocumentationEmptyException() : super(cause: "the number documentation is empty");}
class NumberDocumentationLengthException extends PersonCoreException { NumberDocumentationLengthException() : super(cause: "the number documentation length invalid");}

class DirectionEmptyException extends PersonCoreException { DirectionEmptyException() : super(cause: "the direction is empty");}
class DirectionLengthException extends PersonCoreException { DirectionLengthException() : super(cause: "the direction length not is valid");}
class CellphoneEmptyException extends PersonCoreException { CellphoneEmptyException() : super(cause: "the cellphone is empty");}
class CellphoneLengthException extends PersonCoreException { CellphoneLengthException() : super(cause: "the cellphone length not is valid");}
class CellphoneNotIsNumberException extends PersonCoreException { CellphoneNotIsNumberException() : super(cause: "the cellphone not is a number");}
