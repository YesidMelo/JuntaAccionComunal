abstract class CoreException implements Exception {
  String cause;
  CoreException({
    required this.cause
  });
}

class WithoutDataFirebase extends CoreException { WithoutDataFirebase(): super(cause: "firebase not return all data"); }