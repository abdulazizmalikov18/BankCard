part of 'card_bloc.dart';

abstract class CardEvent {}

class Card extends CardEvent {
  final CardDesign status;
  final String cardType;
  final String cardPrice;
  final String assets;
  final String cardNumber;
  final String cardDate;
  final String cardCvv;
  final String cardName;
  final List colors;
  final File? image;

  Card({
    this.status = CardDesign.assets,
    this.assets = '',
    this.colors = const [],
    this.image,
    this.cardCvv = '',
    this.cardName = '',
    this.cardDate = '',
    this.cardNumber = '',
    this.cardType = '',
    this.cardPrice = '',
  });
}
