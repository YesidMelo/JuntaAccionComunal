part of 'di_generator.dart';

void _initRepositories() {
  getIt
    ..registerLazySingleton<PreregisterPersonRepository>(() => PreregisterPersonRepositoryImpl())
    ..registerLazySingleton<StateRegisteredRepository>(() => StateRegisteredRepositorySourceImpl())
    ..registerLazySingleton<TypeDocumentRepository>(() => TypeDocumentRepositoryImpl())
    ..registerLazySingleton<TypeInhabitantRepository>(() => TypeInhabitantRepositoryImpl())
    ..registerLazySingleton<ListPersonRepository>(() => ListPersonRepositoryImpl())
  ;
}