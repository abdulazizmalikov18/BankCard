import 'dart:io';

import 'package:bankcard/features/main/data/datasources/local/db_helper.dart';
import 'package:bankcard/features/main/domain/entities/bank_card_entity.dart';
import 'package:bankcard/features/main/domain/entities/card_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_event.dart';

part 'card_state.dart';

enum CardDesign { images, assets, colors }

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardState()) {
    on<CardsList>((event, emit) async {
      final bankCards = await BankCardDatabase.instance.readAll();
      bankCards.forEach(
          (bankCard) => print('===> ==> MAna Manda ${bankCard.toMap()}'));
      emit(state.copyWith(cardsList: bankCards));
    });

    on<CardEdit>((event, emit) {
      List<CardEntity> list = List.from(state.cards);
      list[event.index] = CardEntity(
        cardCvv: event.cardCvv,
        cardNumber: event.cardNumber,
        cardDate: event.cardDate,
        cardName: event.cardName,
        assets: 'assets/images/card_1.jpg',
        cardType: event.cardType,
        cardPrice: event.cardPrice,
        file: event.image,
      );
      emit(state.copyWith(cards: list));
    });
    on<CardListAdd>((event, emit) async {
      final idMy = DateTime.now().millisecondsSinceEpoch;
      final bankCard = BankCardEntity(
        id: idMy,
        cardHolderName: event.cardName,
        cardNumber: event.cardNumber,
        expiryDate: event.cardDate,
        cvvCode: event.cardCvv,
        file: event.image?.path,
        assets: event.assets,
        color: event.colors,
        isImage: event.status == CardDesign.assets ? 0 : 1,
      );
      final id = await BankCardDatabase.instance.create(bankCard);
      print('Saved bank card with id: $id');
      add(CardsList());
    });
  }
}
