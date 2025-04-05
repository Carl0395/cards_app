import 'package:cards_app/features/cards/domain/entities/card.dart';

class CardModel extends Card {
  CardModel({
    required super.id,
    required super.name,
    required super.price,
    required super.tag,
    required super.description,
  });

  factory CardModel.fromJson(Map<dynamic, dynamic> map) {
    return CardModel(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      tag: map['tag'] as String,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'tag': tag,
      'description': description,
    };
  }

  factory CardModel.fromEntity(Card card) {
    return CardModel(
      id: card.id,
      name: card.name,
      price: card.price,
      tag: card.tag,
      description: card.description,
    );
  }
}
