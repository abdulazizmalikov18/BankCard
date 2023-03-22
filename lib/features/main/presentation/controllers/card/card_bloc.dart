import 'dart:io';

import 'package:bankcard/assets/constants/images.dart';
import 'package:bankcard/features/main/domain/entities/card_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_event.dart';

part 'card_state.dart';

enum CardDesign { images, assets, colors }

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardState()) {
    on<CardEdit>((event, emit) {
      List<CardEntity> list = List.from(state.cards);
      list[event.index] = CardEntity(
        cardCvv: event.cardCvv,
        cardNumber: event.cardNumber,
        cardDate: event.cardDate,
        cardName: event.cardName,
        assets: event.assets,
        cardType: event.cardType,
        cardPrice: event.cardPrice,
      );
      emit(state.copyWith(cards: list));
    });
    on<CardListAdd>((event, emit) {
      emit(state.copyWith(
        cards: [
          ...state.cards,
          CardEntity(
            cardCvv: event.cardCvv,
            cardNumber: event.cardNumber,
            cardDate: event.cardDate,
            cardName: event.cardName,
            assets: event.assets,
            cardType: event.cardType,
            cardPrice: event.cardPrice,
          ),
        ],
      ));
    });
  }
}
