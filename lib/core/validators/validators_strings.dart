import 'package:jac/core/exceptions/exceptions.dart';

extension StringValidators on String {

  bool validNameAndLastName() {
    if(isEmpty) throw NameAndLastNameEmptyException();
    if(length < 5) throw NameAndLastNameLengthException();
    return true;
  }

  bool validDocumentationNumber() {
    if(isEmpty) throw NumberDocumentationEmptyException();
    if(length < 5) throw NumberDocumentationEmptyException();
    return true;
  }

}