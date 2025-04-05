import 'package:cards_app/features/cards/domain/repositories/cards_repository.dart';

class DeleteCardUseCase {
  final CardsRepository cardsRepository;

  DeleteCardUseCase(this.cardsRepository);

  Future<void> call(String idCard) async {
    await cardsRepository.deleteCard(idCard);
  }
}
