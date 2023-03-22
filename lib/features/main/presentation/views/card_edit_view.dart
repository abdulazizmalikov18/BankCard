import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/assets/constants/formatters.dart';
import 'package:bankcard/features/common/components/card_type.dart';
import 'package:bankcard/features/common/widgets/w_button.dart';
import 'package:bankcard/features/common/widgets/w_scale.dart';
import 'package:bankcard/features/common/widgets/w_textfield.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:bankcard/features/main/presentation/widgets/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardEditView extends StatefulWidget {
  const CardEditView({
    super.key,
    required this.image,
    required this.name,
    required this.number,
    required this.date,
    required this.type,
    required this.price,
  });
  final String image;
  final String name;
  final String number;
  final String date;
  final CardType type;
  final String price;

  @override
  State<CardEditView> createState() => _CardEditViewState();
}

class _CardEditViewState extends State<CardEditView> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerCardNumber = TextEditingController();
  TextEditingController controllerCardCvv = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int select = 0;
  bool isImage = true;

  @override
  void initState() {
    select = images.indexOf(widget.image);
    controller.text = widget.name;
    controllerCardCvv.text = '001';
    controllerCardNumber.text = widget.number;
    dateController.text = widget.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Edition"),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BankCard(
                  image: isImage ? images[select] : null,
                  date: widget.date,
                  name: widget.name,
                  number: widget.number,
                  price: widget.price,
                  type: widget.type,
                  colors: colors[select],
                  onTap: () {},
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: images.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => WScaleAnimation(
                      onTap: () {
                        setState(() {
                          select = index;
                          isImage = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: select == index && isImage
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
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: colors.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => WScaleAnimation(
                      onTap: () {
                        setState(() {
                          select = index;
                          isImage = false;
                        });
                      },
                      child: Container(
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
                      ),
                    ),
                  ),
                ),
                MyTextField(
                  controller: controller,
                  hintText: "Card Name",
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: controllerCardNumber,
                        margin: const EdgeInsets.only(left: 16),
                        type: TextInputType.number,
                        hintText: '#### #### #### ####',
                        formatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CardNumberInputFormatter()
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        controller: controllerCardCvv,
                        hintText: '###',
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        type: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 112,
                  child: MyTextField(
                    controller: dateController,
                    hintText: '##/##',
                    onChanged: (value) {},
                    formatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardMonthInputFormatter(),
                    ],
                    type: TextInputType.datetime,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: WButton(
        margin: const EdgeInsets.fromLTRB(16, 01, 16, 16),
        text: 'Save',
        onTap: () {
          context.read<CardBloc>().add(
                CardEdit(
                  assets: images[select],
                  status: isImage ? CardDesign.assets : CardDesign.colors,
                  cardCvv: controllerCardCvv.text,
                  cardDate: dateController.text,
                  cardName: controller.text,
                  cardNumber: controllerCardNumber.text,
                  cardPrice: '0',
                  cardType: 'humo',
                  colors: colors[select],
                ),
              );
          Navigator.pop(context);
        },
      ),
    );
  }
}
