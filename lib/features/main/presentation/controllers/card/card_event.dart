part of 'card_bloc.dart';

abstract class CardEvent {}

class CardEdit extends CardEvent {
  final CardDesign status;
  final int index;
  final String cardType;
  final String cardPrice;
  final String assets;
  final String cardNumber;
  final String cardDate;
  final String cardCvv;
  final String cardName;
  final LinearGradient? colors;
  final File? image;

  CardEdit({
    this.status = CardDesign.assets,
    this.assets = '',
    this.index = 0,
    this.colors,
    this.image,
    this.cardCvv = '',
    this.cardName = '',
    this.cardDate = '',
    this.cardNumber = '',
    this.cardType = '',
    this.cardPrice = '',
  });
}

class CardListAdd extends CardEvent {
  final CardDesign status;
  final String cardType;
  final String cardPrice;
  final String assets;
  final String cardNumber;
  final String cardDate;
  final String cardCvv;
  final String cardName;
  final LinearGradient? colors;
  final File? image;

  CardListAdd({
    this.status = CardDesign.assets,
    this.assets = '',
    this.colors,
    this.image,
    this.cardCvv = '',
    this.cardName = '',
    this.cardDate = '',
    this.cardNumber = '',
    this.cardType = '',
    this.cardPrice = '',
  });
}
