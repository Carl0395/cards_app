import 'package:cards_app/features/cards/domain/repositories/cards_repository.dart';
import 'package:cards_app/features/cards/domain/use_cases/create_card_use_case.dart';
import 'package:cards_app/features/cards/domain/use_cases/delete_card_use_case.dart';
import 'package:cards_app/features/cards/domain/use_cases/get_cards_use_case.dart';
import 'package:cards_app/features/cards/domain/use_cases/update_card_use_case.dart';
import 'package:cards_app/features/cards/infrastructure/card_repository_impl.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // Repositorios
  getIt.registerLazySingleton<CardsRepository>(() => CardRepositoryImpl());

  // Casos de uso
  getIt.registerLazySingleton(() => GetCardsUseCase(getIt<CardsRepository>()));
  getIt.registerLazySingleton(
    () => CreateCardUseCase(getIt<CardsRepository>()),
  );
  getIt.registerLazySingleton(
    () => UpdateCardUseCase(getIt<CardsRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteCardUseCase(getIt<CardsRepository>()),
  );

  // Bloc
  getIt.registerFactory(
    () => CardsBloc(
      createCardUseCase: getIt(),
      deleteCardUseCase: getIt(),
      getCardsUseCase: getIt(),
      updateCardUseCase: getIt(),
    ),
  );
}
