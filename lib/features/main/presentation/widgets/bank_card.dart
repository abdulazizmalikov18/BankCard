import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/features/common/widgets/w_scale.dart';
import 'package:bankcard/features/main/presentation/views/card_edit_view.dart';
import 'package:bankcard/utils/my_function.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    super.key,
    required this.image,
    required this.name,
    required this.number,
    required this.date,
    required this.type,
    required this.price,
    required this.onTap,
  });
  final String image;
  final String name;
  final String number;
  final String date;
  final String type;
  final String price;
  final VoidCallback onTap;

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
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          gradient: const LinearGradient(
            colors: [Colors.amber, Colors.red, Colors.blue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
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
                  const SizedBox(height: 8),
                  Text(
                    '$price UZS',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${number.substring(0, 7)} .... ${number.substring(15)}',
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
              if (MyFunction.cardIconType(type: type).isNotEmpty)
                Container(
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        MyFunction.cardIconType(type: type),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
