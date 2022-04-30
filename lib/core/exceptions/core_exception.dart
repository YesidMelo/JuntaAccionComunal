abstract class CoreException implements Exception {
  String cause;
  CoreException({
    required this.cause
  });
}