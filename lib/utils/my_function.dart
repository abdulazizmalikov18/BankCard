import 'package:bankcard/assets/constants/images.dart';

class MyFunction {
  static String lockCardNumbar({required String cardNumber}) {
    final int length = cardNumber.length;
    final int replaceLength = length - 4;
    final String replacement =
        List<String>.generate((replaceLength / 4).ceil(), (int _) => '.... ')
            .join('');
    return cardNumber.replaceRange(0, replaceLength, replacement);
  }

  static String cardIconType({required String type}) {
    if (type == 'humo') {
      return AppImages.humo;
    } else if (type == 'visa') {
      return AppImages.visa;
    } else if (type == 'mastercard') {
      return AppImages.mastercard;
    } else if (type == 'uzcard') {
      return AppImages.uzcard;
    } else {
      return '';
    }
  }
}
