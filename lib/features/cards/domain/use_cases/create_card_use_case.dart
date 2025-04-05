import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/domain/repositories/cards_repository.dart';

class CreateCardUseCase {
  final CardsRepository cardsRepository;

  CreateCardUseCase(this.cardsRepository);

  Future<void> call(Card card) async {
    await cardsRepository.createCard(card);
  }
}
