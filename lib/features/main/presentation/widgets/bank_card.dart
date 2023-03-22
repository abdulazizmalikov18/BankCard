import 'dart:io';

import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/features/common/components/card_type.dart';
import 'package:bankcard/utils/my_function.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    super.key,
    this.image,
    required this.name,
    required this.number,
    required this.date,
    required this.type,
    required this.price,
    required this.onTap,
    this.colors,
    this.isNew = false,
    this.imageMy,
  });
  final String? image;
  final String name;
  final String number;
  final String date;
  final CardType type;
  final String price;
  final LinearGradient? colors;
  final VoidCallback onTap;
  final bool isNew;
  final File? imageMy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: imageMy != null
              ? DecorationImage(
                  image: FileImage(imageMy!),
                  fit: BoxFit.cover,
                )
              : image != null
                  ? DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null,
          gradient: colors,
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black26,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  if (!isNew)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '$price UZS',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ),
                  if (!isNew)
                    Text(
                      '${number.substring(0, 7)} .... ${number.substring(15)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  if (isNew)
                    Text(
                      number,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: 80,
                child: MyFunction.getCardIcon(type),
              )
            ],
          ),
        ),
      ),
    );
  }
}
