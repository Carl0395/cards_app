import 'package:cards_app/core/routes.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_state.dart';
import 'package:cards_app/features/cards/presentation/pages/cards_list/widgets/card_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListPage extends StatelessWidget {
  const CardsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'createButton',
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, Routes.cardForm);
        },
      ),
      appBar: AppBar(title: Text('Tarjetas')),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          final cards = state.cards;
          if (cards.isEmpty) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 70,
                    color: Colors.grey.shade500,
                  ),
                  Text(
                    'Aún no hay tarjetas creadas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 160),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return CardBox(card: card, index: index);
            },
          );
        },
      ),
    );
  }
}
