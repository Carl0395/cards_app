import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/domain/use_cases/create_card_use_case.dart';
import 'package:cards_app/features/cards/domain/use_cases/delete_card_use_case.dart';
import 'package:cards_app/features/cards/domain/use_cases/get_cards_use_case.dart';
import 'package:cards_app/features/cards/domain/use_cases/update_card_use_case.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_event.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final GetCardsUseCase getCardsUseCase;
  final CreateCardUseCase createCardUseCase;
  final UpdateCardUseCase updateCardUseCase;
  final DeleteCardUseCase deleteCardUseCase;

  CardsBloc({
    required this.getCardsUseCase,
    required this.createCardUseCase,
    required this.updateCardUseCase,
    required this.deleteCardUseCase,
  }) : super(CardsState([])) {
    on<LoadCards>((event, emit) async {
      emit(CardsState(await getCardsUseCase()));
    });
    on<CreateCard>((event, emit) async {
      await createCardUseCase(
        Card(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: event.name,
          price: event.price,
          tag: event.tag,
          description: event.description,
        ),
      );
      emit(CardsState(await getCardsUseCase()));
    });
    on<UpdateCard>((event, emit) async {
      await updateCardUseCase(event.cardUpdated);
      emit(CardsState(await getCardsUseCase()));
    });
    on<DeleteCard>((event, emit) async {
      await deleteCardUseCase(event.idCard);
      emit(CardsState(await getCardsUseCase()));
    });

    add(LoadCards());
  }
}
