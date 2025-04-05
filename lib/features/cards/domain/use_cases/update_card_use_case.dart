import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/domain/repositories/cards_repository.dart';

class UpdateCardUseCase {
  final CardsRepository cardsRepository;

  UpdateCardUseCase(this.cardsRepository);

  Future<void> call(Card card) async {
    await cardsRepository.updateCard(card);
  }
}
