import 'package:bankcard/features/common/components/card_type.dart';
import 'package:flutter/material.dart';

class MyFunction {
  static String lockCardNumbar({required String cardNumber}) {
    final int length = cardNumber.length;
    final int replaceLength = length - 4;
    final String replacement =
        List<String>.generate((replaceLength / 4).ceil(), (int _) => '.... ')
            .join('');
    return cardNumber.replaceRange(0, replaceLength, replacement);
  }

  static CardType cardType({required String type}) {
    if (type == 'humo') {
      return CardType.Humo;
    } else if (type == 'visa') {
      return CardType.Visa;
    } else if (type == 'mastercard') {
      return CardType.Master;
    } else if (type == 'uzcard') {
      return CardType.Uzcard;
    } else {
      return CardType.Others;
    }
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.Uzcard:
        img = 'uzcard.png';
        break;
      case CardType.Humo:
        img = 'humo.png';
        break;
      case CardType.Master:
        img = 'mastercard.png';
        break;
      case CardType.Visa:
        img = 'visa.png';
        break;
      case CardType.Others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(r'(8600)'))) {
      cardType = CardType.Uzcard;
    } else if (input.startsWith(RegExp(r'(9860)'))) {
      cardType = CardType.Humo;
    } else if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }
}
