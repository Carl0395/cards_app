import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/domain/repositories/cards_repository.dart';

class GetCardsUseCase {
  final CardsRepository cardsRepository;

  GetCardsUseCase(this.cardsRepository);

  Future<List<Card>> call() async {
    return await cardsRepository.getCards();
  }
}
