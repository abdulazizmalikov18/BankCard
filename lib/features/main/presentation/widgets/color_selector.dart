import 'package:bankcard/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class ColorContainerSelector extends StatelessWidget {
  const ColorContainerSelector({
    super.key,
    required this.select,
    required this.isImage,
    required this.index,
  });

  final int select;
  final bool isImage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        gradient: colors[index],
      ),
      child: select == index && !isImage
          ? Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(60),
              ),
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(width: 5, color: white),
                ),
              ),
            )
          : null,
    );
  }
}
