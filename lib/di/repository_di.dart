part of 'di_generator.dart';

void _initRepositories() {
  getIt
    ..registerLazySingleton<PreregisterPersonRepository>(() => PreregisterPersonRepositoryImpl())
    ..registerLazySingleton<StateRegisteredRepositorySource>(() => StateRegisteredRepositorySourceImpl())
    ..registerLazySingleton<TypeDocumentRepository>(() => TypeDocumentRepositoryImpl())
    ..registerLazySingleton<TypeInhabitantRepository>(() => TypeInhabitantRepositoryImpl())
  ;
}