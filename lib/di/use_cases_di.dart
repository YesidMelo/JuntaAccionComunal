part of 'di_generator.dart';

void _initUseCases() {
  getIt
  ///generic
    ..registerLazySingleton<GetTypeDocumentUseCase>(() => GetTypeDocumentUseCaseImpl())
    ..registerLazySingleton<GetTypeInhabitantsUseCase>(() => GetTypeInhabitantsUseCaseImpl())
    ..registerLazySingleton<GetStatesRegisteredUseCase>(() => GetStatesRegisteredUseCaseImpl())
  ///Person
    ..registerLazySingleton<PreregisterPersonCreateNewPersonUseCase>(() => PreregisterPersonCreateNewPersonUseCaseImpl())
    ..registerLazySingleton<PreregisterPersonGetCurrentPersonUseCase>(() => PreregisterPersonGetCurrentPersonUseCaseImpl())
    ..registerLazySingleton<PreregisterPersonSendPersonUseCase>(() => PreregisterPersonSendPersonUseCaseImpl())

  ;
}