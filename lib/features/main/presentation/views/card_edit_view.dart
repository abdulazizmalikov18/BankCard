import 'dart:io';

import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/features/common/components/card_type.dart';
import 'package:bankcard/features/common/widgets/w_button.dart';
import 'package:bankcard/features/common/widgets/w_scale.dart';
import 'package:bankcard/features/common/widgets/w_textfield.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:bankcard/features/main/presentation/widgets/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CardEditView extends StatefulWidget {
  const CardEditView({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.number,
    required this.date,
    required this.type,
    required this.price,
    required this.cvvCode,
    this.file,
  });
  final String image;
  final String name;
  final String cvvCode;
  final String number;
  final String date;
  final CardType type;
  final String price;
  final File? file;
  final int id;

  @override
  State<CardEditView> createState() => _CardEditViewState();
}

class _CardEditViewState extends State<CardEditView> {
  TextEditingController controller = TextEditingController();

  int select = 0;
  bool isImage = true;
  File? imageMy;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    final imageTempopary = File(image.path);
    setState(() {
      imageMy = imageTempopary;
    });
  }

  @override
  void initState() {
    if (widget.file == null) {
      select = images.indexOf(widget.image);
    }
    imageMy = widget.file;
    controller.text = widget.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
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
                    imageMy: imageMy,
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
                                      border:
                                          Border.all(width: 5, color: white),
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
                            imageMy = null;
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
                                      border:
                                          Border.all(width: 5, color: white),
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
                    image: imageMy,
                    assets: images[select],
                    status: isImage ? CardDesign.assets : CardDesign.colors,
                    cardCvv: widget.cvvCode,
                    cardDate: widget.date,
                    cardName: controller.text,
                    cardNumber: widget.number,
                    colors: select,
                    index: widget.id,
                  ),
                );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
