import 'package:cards_app/features/cards/domain/entities/card.dart';

abstract class CardsEvent {}

class LoadCards extends CardsEvent {}

class CreateCard extends CardsEvent {
  final String name;
  final String price;
  final String tag;
  final String description;

  CreateCard(this.name, this.price, this.tag, this.description);
}

class UpdateCard extends CardsEvent {
  final Card cardUpdated;

  UpdateCard(this.cardUpdated);
}

class DeleteCard extends CardsEvent {
  final String idCard;

  DeleteCard(this.idCard);
}
