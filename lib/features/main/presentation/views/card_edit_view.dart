import 'package:bankcard/assets/constants/images.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:bankcard/features/main/presentation/widgets/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardEditView extends StatefulWidget {
  const CardEditView({super.key, this.index = 0});
  final int index;

  @override
  State<CardEditView> createState() => _CardEditViewState();
}

class _CardEditViewState extends State<CardEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return Column(
            children: [
              BankCard(
                image: state.cards[widget.index].assets,
                date: state.cards[widget.index].cardDate,
                name: state.cards[widget.index].cardName,
                number: state.cards[widget.index].cardNumber,
                price: state.cards[widget.index].cardPrice,
                type: state.cards[widget.index].cardType,
                onTap: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
