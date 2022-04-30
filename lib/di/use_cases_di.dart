part of 'di_generator.dart';

void _initUseCases() {
  getIt
    ..registerLazySingleton<PreregisterPersonCreateNewPersonUseCase>(() => PreregisterPersonCreateNewPersonUseCaseImpl())
    ..registerLazySingleton<PreregisterPersonGetCurrentPersonUseCase>(() => PreregisterPersonGetCurrentPersonUseCaseImpl())
  ;
}