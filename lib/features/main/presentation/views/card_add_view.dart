import 'dart:io';
import "dart:math";

import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/assets/constants/formatters.dart';
import 'package:bankcard/features/common/components/card_type.dart';
import 'package:bankcard/features/common/widgets/w_button.dart';
import 'package:bankcard/features/common/widgets/w_scale.dart';
import 'package:bankcard/features/common/widgets/w_textfield.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:bankcard/features/main/presentation/widgets/bank_card.dart';
import 'package:bankcard/features/main/presentation/widgets/color_selector.dart';
import 'package:bankcard/features/main/presentation/widgets/image_container_selector.dart';
import 'package:bankcard/utils/my_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerCardNumber = TextEditingController();
  TextEditingController controllerCardCvv = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int select = Random().nextInt(7);
  bool isImage = true;
  CardType cardType = CardType.Invalid;

  File? imageMy;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    final imageTempopary = File(image.path);
    setState(() {
      imageMy = imageTempopary;
    });
  }

  void getCardTypeFrmNum() {
    String cardNum = MyFunction.getCleanedNumber(controllerCardNumber.text);
    CardType type = MyFunction.getCardTypeFrmNumber(cardNum);
    if (type != cardType) {
      setState(() {
        cardType = type;
      });
    }
  }

  @override
  void initState() {
    controllerCardNumber.addListener(() {
      getCardTypeFrmNum();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Card Add"),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BankCard(
                image: isImage ? images[select] : null,
                date: dateController.text,
                name: controller.text,
                number: controllerCardNumber.text,
                price: '',
                type: cardType,
                colors: colors[select],
                isNew: true,
                imageMy: imageMy,
                onTap: () {},
              ),
              WButton(
                onTap: () {
                  getImage();
                },
                text: 'Galary',
                margin: const EdgeInsets.all(16),
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
                        imageMy = null;
                      });
                    },
                    child: ImageContainerSelector(
                      select: select,
                      isImage: isImage,
                      index: index,
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
                        imageMy = null;
                      });
                    },
                    child: ColorContainerSelector(
                      select: select,
                      isImage: isImage,
                      index: index,
                    ),
                  ),
                ),
              ),
              MyTextField(
                controller: controller,
                hintText: "Card Name",
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: MyTextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controllerCardNumber,
                      margin: const EdgeInsets.only(left: 16),
                      type: TextInputType.number,
                      hintText: '#### #### #### ####',
                      formatter: [Formatters.cardFormatter],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MyTextField(
                      controller: controllerCardCvv,
                      hintText: '###',
                      formatter: [Formatters.cvvFormatr],
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
                  onChanged: (value) {
                    setState(() {});
                  },
                  formatter: [Formatters.cardExpirationDateFormatter],
                  type: TextInputType.datetime,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: WButton(
          margin: const EdgeInsets.fromLTRB(16, 01, 16, 16),
          text: 'Save',
          isDisabled: !(dateController.text.length == 5 &&
              controllerCardNumber.text.length == 19 &&
              controllerCardCvv.text.length == 3 &&
              controller.text.isNotEmpty),
          onTap: () {
            context.read<CardBloc>().add(
                  CardListAdd(
                    image: imageMy,
                    assets: images[select],
                    status: isImage ? CardDesign.assets : CardDesign.colors,
                    cardCvv: controllerCardCvv.text,
                    cardDate: dateController.text,
                    cardName: controller.text,
                    cardNumber: controllerCardNumber.text,
                    colors: select,
                  ),
                );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
