import 'dart:io';

import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:bankcard/features/main/presentation/views/card_add_view.dart';
import 'package:bankcard/features/main/presentation/views/card_edit_view.dart';
import 'package:bankcard/features/main/presentation/widgets/bank_card.dart';
import 'package:bankcard/utils/my_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  @override
  void initState() {
    context.read<CardBloc>().add(CardsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.cardsList.length,
              itemBuilder: (context, index) => BankCard(
                imageMy: state.cardsList[index].file == null
                    ? null
                    : File(state.cardsList[index].file!),
                image: state.cardsList[index].isImage == 0
                    ? state.cardsList[index].assets
                    : null,
                date: state.cardsList[index].expiryDate,
                name: state.cardsList[index].cardHolderName,
                number: state.cardsList[index].cardNumber,
                price: state.cardsList[index].cvvCode,
                colors: state.cardsList[index].color != null
                    ? colors[state.cardsList[index].color!]
                    : null,
                type: MyFunction.getCardTypeFrmNumber(
                  state.cardsList[index].cardNumber,
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CardEditView(
                      isImage: state.cardsList[index].isImage == 0,
                      id: state.cardsList[index].id,
                      image: state.cardsList[index].assets!,
                      date: state.cardsList[index].expiryDate,
                      name: state.cardsList[index].cardHolderName,
                      number: state.cardsList[index].cardNumber,
                      price: state.cardsList[index].cvvCode,
                      cvvCode: state.cardsList[index].cvvCode,
                      file: state.cardsList[index].file == null
                          ? null
                          : File(state.cardsList[index].file!),
                      type: MyFunction.getCardTypeFrmNumber(
                        state.cardsList[index].cardNumber,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
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
