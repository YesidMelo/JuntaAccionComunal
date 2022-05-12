abstract class CloudFirestoreExceptionFirestore implements Exception {
  String cause;
  CloudFirestoreExceptionFirestore({required this.cause});
}

class CloudFirestoreExceptionFirestoreNotConnectionInternet extends CloudFirestoreExceptionFirestore{ CloudFirestoreExceptionFirestoreNotConnectionInternet() : super(cause: "Your device not has internet"); }

