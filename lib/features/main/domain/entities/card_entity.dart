import 'dart:io';

class CardEntity {
  final String cardNumber;
  final String cardDate;
  final String cardPrice;
  final String cardCvv;
  final List cardColor;
  final String cardName;
  final String? assets;
  final File? file;
  final String cardType;

  const CardEntity({
    this.cardNumber = '',
    this.cardDate = '',
    this.cardCvv = '',
    this.cardColor = const [],
    this.cardName = '',
    this.assets,
    this.file,
    this.cardType = '',
    this.cardPrice = '',
  });
}
