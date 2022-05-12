abstract class CoreException implements Exception {
  String cause;
  CoreException({
    required this.cause
  });
}

class WithoutDataFirebaseException extends CoreException { WithoutDataFirebaseException(): super(cause: "firebase not return all data"); }
class NotConnectionInternetException extends CoreException { NotConnectionInternetException(): super(cause: "not connection to internet"); }