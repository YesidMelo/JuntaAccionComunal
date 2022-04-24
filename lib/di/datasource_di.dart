part of 'di_generator.dart';

void _initDatasources() {
  getIt
    .registerLazySingleton<HandlerFirestore>(() => HandlerFirestoreImpl())
  ;
}