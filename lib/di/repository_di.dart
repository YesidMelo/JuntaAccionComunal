part of 'di_generator.dart';

void _initRepositories() {
  getIt
    ..registerLazySingleton<PreregisterPersonRepository>(() => PreregisterPersonRepositoryImpl())
    ..registerLazySingleton<TypeInhabitantRepository>(() => TypeInhabitantRepositoryImpl())
  ;
}