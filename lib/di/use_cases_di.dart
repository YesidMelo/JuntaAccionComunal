part of 'di_generator.dart';

void _initUseCases() {
  getIt
  ///generic
    ..registerLazySingleton<GetTypeDocumentUseCase>(() => GetTypeDocumentUseCaseImpl())
  ///Person
    ..registerLazySingleton<PreregisterPersonCreateNewPersonUseCase>(() => PreregisterPersonCreateNewPersonUseCaseImpl())
    ..registerLazySingleton<PreregisterPersonGetCurrentPersonUseCase>(() => PreregisterPersonGetCurrentPersonUseCaseImpl())

  ;
}