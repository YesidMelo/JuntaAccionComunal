import 'package:jac/core/common/code_errors.dart';

abstract class Result<T>{}

class Success<T> extends Result<T>{
  T? data;
  Success({
    required this.data
  });
}

class Error<T> extends Result<T> {
  CodeErrors codeError;
  Error({
    required this.codeError
  });
}