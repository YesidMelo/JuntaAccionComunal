import 'package:jac/core/exceptions/exceptions.dart';
import 'package:jac/core/utils/constants.dart';

extension StringValidators on String {

  String format({required List<String> args}) {
    StringBuffer builder = StringBuffer();
    List<String> listOriginal = split(Constants.keyReplacementString);
    if(listOriginal.length != args.length + 1) throw Exception("the length by format not is valid");
    args.forEach((element) {
      int index = args.indexOf(element);
      builder.write(listOriginal[index]);
      builder.write(element);
    });
    builder.write(listOriginal.last);
    return builder.toString();
  }

  bool validNameAndLastName() {
    if(isEmpty) throw NameAndLastNameEmptyException();
    if(length < Constants.preregisterMinimunCharacterByName) throw NameAndLastNameLengthException();
    return true;
  }

  bool validDocumentationNumber() {
    if(isEmpty) throw NumberDocumentationEmptyException();
    if(length < Constants.preregisterMinimunCharacterByDocument) throw NumberDocumentationEmptyException();
    return true;
  }

}