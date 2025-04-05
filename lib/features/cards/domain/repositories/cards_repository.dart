import 'package:cards_app/features/cards/domain/entities/card.dart';

abstract class CardsRepository {
  Future<List<Card>> getCards();
  Future<void> createCard(Card card);
  Future<void> updateCard(Card card);
  Future<void> deleteCard(String id);
}
