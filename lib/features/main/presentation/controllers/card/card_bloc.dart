import 'dart:io';

import 'package:bankcard/core/usecases/usecase.dart';
import 'package:bankcard/features/main/data/datasources/local/db_helper.dart';
import 'package:bankcard/features/main/domain/entities/bank_card_entity.dart';
import 'package:bankcard/features/main/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'card_event.dart';

part 'card_state.dart';

enum CardDesign { images, assets, colors }

class CardBloc extends Bloc<CardEvent, CardState> {
  CardsUseUseCase useCase = CardsUseUseCase();
  CardBloc() : super(const CardState()) {
    on<CardsList>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          cardsList: result.right.data,
          status: FormzStatus.submissionSuccess,
        ));
      } else {
        final bankCards = await BankCardDatabase.instance.readAll();
        emit(state.copyWith(
          cardsList: bankCards,
          status: FormzStatus.submissionSuccess,
        ));
      }
    });

    on<CardEdit>((event, emit) async {
      final bankCard = BankCardEntity(
        id: event.index,
        cardHolderName: event.cardName,
        cardNumber: event.cardNumber,
        expiryDate: event.cardDate,
        cvvCode: event.cardCvv,
        file: event.image?.path,
        assets: event.assets,
        color: event.colors,
        isImage: event.status == CardDesign.assets ? 0 : 1,
      );
      final id = await BankCardDatabase.instance.update(bankCard);
      print('Saved bank card with id: $id');
      add(CardsList());
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
