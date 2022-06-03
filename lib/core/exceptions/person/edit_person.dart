import 'package:jac/core/core.dart';

abstract class EditPersonException extends PersonCoreException {EditPersonException({required String cause}) : super(cause: cause);}

class StateRegisterPersonException extends EditPersonException {StateRegisterPersonException(): super(cause: "The person not has a state of register");}