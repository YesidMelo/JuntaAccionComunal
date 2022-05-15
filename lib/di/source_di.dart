part of 'di_generator.dart';


void _initSources() {
  getIt
    ..registerLazySingleton<ListPersonLocalSource>(() => ListPersonLocalSourceImpl())
    ..registerLazySingleton<ListPersonRemoteSource>(() => ListPersonRemoteSourceImpl())
    ..registerLazySingleton<PreregisterPersonLocalsource>(() => PreregisterPersonLocalsourceImpl())
    ..registerLazySingleton<PreregisterPersonRemotesource>(() => PreregisterPersonRemotesourceImpl())
    ..registerLazySingleton<StateRegisteredLocalSource>(() => StateRegisteredLocalSourceImpl())
    ..registerLazySingleton<StateRegisteredRemoteSource>(() => StateRegisteredRemoteSourceImpl())
    ..registerLazySingleton<TypeDocumentLocalSource>(() => TypeDocumentLocalSourceImpl())
    ..registerLazySingleton<TypeDocumentRemoteSource>(() => TypeDocumentRemoteSourceImpl())
    ..registerLazySingleton<TypeInhabitantLocalSource>(() => TypeInhabitantLocalSourceImpl())
    ..registerLazySingleton<TypeInhabitantRemoteSource>(() => TypeInhabitantRemoteSourceImpl())
  ;
}