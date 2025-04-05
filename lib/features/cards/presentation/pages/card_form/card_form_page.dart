import 'package:cards_app/features/cards/domain/entities/card.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_event.dart';
import 'package:cards_app/features/cards/presentation/pages/card_form/widgets/custom_input.dart';
import 'package:cards_app/shared/snackbar.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

class CardFormPage extends StatefulWidget {
  final Card? card;
  const CardFormPage({super.key, this.card});

  @override
  State<CardFormPage> createState() => _CardFormPageState();
}

class _CardFormPageState extends State<CardFormPage> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final tagController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final card = widget.card;
    if (card != null) {
      nameController.text = card.name;
      priceController.text = card.price;
      tagController.text = card.tag;
      descriptionController.text = card.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.card != null ? 'Actualiza la tarjeta' : 'Crea una tarjeta',
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    widget.card != null
                        ? 'Actualiza los campos que desees de la tarjeta'
                        : 'Ingresa todos los campos para crear una nueva tarjeta:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  CustomInput(hintText: 'Nombre', controller: nameController),
                  SizedBox(height: 12),
                  CustomInput(
                    hintText: 'Precio',
                    keyboardType: TextInputType.number,
                    controller: priceController,
                  ),
                  SizedBox(height: 12),
                  CustomInput(hintText: 'Etiqueta', controller: tagController),
                  SizedBox(height: 12),
                  CustomInput(
                    maxLines: 8,
                    hintText: 'Descripción',
                    controller: descriptionController,
                  ),
                  SizedBox(height: 24),
                  MaterialButton(
                    splashColor: Color(0xFF1340D8),
                    onPressed: _saveCard,
                    minWidth: double.infinity,
                    height: 55,
                    color: Color(0xFF1E51FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Guardar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveCard() {
    final name = nameController.text;
    final price = priceController.text;
    final tag = tagController.text;
    final description = descriptionController.text;

    if (name.isEmpty || price.isEmpty || tag.isEmpty || description.isEmpty) {
      showSnackbarMessage(context, 'Debes ingresar todos los campos');
      return;
    }

    if (widget.card != null) {
      context.read<CardsBloc>().add(
        UpdateCard(
          widget.card!.copyWidth(
            name: name,
            price: price,
            tag: tag,
            description: description,
          ),
        ),
      );
    } else {
      context.read<CardsBloc>().add(CreateCard(name, price, tag, description));
    }
    Navigator.of(context).pop();
  }
}
