import 'package:cards_app/core/routes.dart';
import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_event.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_state.dart';
import 'package:cards_app/features/cards/presentation/pages/card_detail/widgets/header.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDetailPage extends StatelessWidget {
  final int cardIndex;
  const CardDetailPage({super.key, required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsBloc, CardsState>(
      builder: (context, state) {
        final card = state.cards[cardIndex.clamp(0, state.cards.length - 1)];
        return Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'edit',
                onPressed: () => _onEdit(context, card),
                child: Icon(Icons.edit, color: Colors.white),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'delete',
                onPressed: () => _onDelete(context, card.id),
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.delete_outline_rounded, color: Colors.white),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  card.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFE6E8EC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(card.tag),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 20),
                child: Text(card.description, style: TextStyle(fontSize: 17)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 20),
                child: Text(
                  '\$${card.price}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onEdit(BuildContext context, Card card) {
    Navigator.of(context).pushNamed(Routes.cardForm, arguments: card);
  }

  void _onDelete(BuildContext context, String id) async {
    Navigator.of(context).pop();
    context.read<CardsBloc>().add(DeleteCard(id));
  }
}
