part of 'di_generator.dart';


void _initSources() {
  getIt
    ..registerLazySingleton<PreregisterPersonLocalsource>(() => PreregisterPersonLocalsourceImpl())
    ..registerLazySingleton<PreregisterPersonRemotesource>(() => PreregisterPersonRemotesourceImpl())
  ;
}