import 'package:cards_app/core/routes.dart';
import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_svg/svg.dart';

class CardBox extends StatelessWidget {
  final Card card;
  final int index;
  const CardBox({super.key, required this.card, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.cardDetail, arguments: index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFE7E6E6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(
                'assets/box.svg',
                height: 40,
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('\$${card.price}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
