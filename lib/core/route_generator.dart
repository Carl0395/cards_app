import 'package:cards_app/core/routes.dart';
import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/presentation/pages/card_detail/card_detail_page.dart';
import 'package:cards_app/features/cards/presentation/pages/card_form/card_form_page.dart';
import 'package:cards_app/features/cards/presentation/pages/cards_list/cards_list_page.dart';
import 'package:flutter/material.dart' hide Card;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.cardList:
        return MaterialPageRoute(builder: (_) => CardsListPage());
      case Routes.cardDetail:
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => CardDetailPage(cardIndex: args),
          );
        }
        return MaterialPageRoute(builder: (_) => CardsListPage());
      case Routes.cardForm:
        final card = args is Card ? args : null;
        return MaterialPageRoute(builder: (_) => CardFormPage(card: card));
      default:
        return MaterialPageRoute(builder: (_) => CardsListPage());
    }
  }
}
