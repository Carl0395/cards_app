import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/domain/repositories/cards_repository.dart';
import 'package:cards_app/features/cards/infrastructure/card_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardRepositoryImpl extends CardsRepository {
  @override
  Future<void> createCard(Card card) async {
    Box box = await Hive.openBox('cards');
    box.put(card.id, CardModel.fromEntity(card).toJson());
  }

  @override
  Future<void> deleteCard(String id) async {
    Box box = await Hive.openBox('cards');
    box.delete(id);
  }

  @override
  Future<List<Card>> getCards() async {
    await Hive.initFlutter();
    Box box = await Hive.openBox('cards');

    return box.values.map((card) {
      return CardModel.fromJson(card);
    }).toList();
  }

  @override
  Future<void> updateCard(Card card) async {
    await createCard(card);
  }
}
