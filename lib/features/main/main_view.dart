import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/features/common/widgets/w_scale.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:bankcard/features/main/presentation/views/card_add_view.dart';
import 'package:bankcard/features/main/presentation/views/card_edit_view.dart';
import 'package:bankcard/features/main/presentation/widgets/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.cards.length,
            itemBuilder: (context, index) => BankCard(
              image: state.cards[index].assets,
              date: state.cards[index].cardDate,
              name: state.cards[index].cardName,
              number: state.cards[index].cardNumber,
              price: state.cards[index].cardPrice,
              type: state.cards[index].cardType,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CardEditView(
                    index: index,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddCardView(),
          ));
        },
        child: const Icon(Icons.add_card),
      ),
    );
  }
}
