import 'package:bankcard/assets/colors/colors.dart';
import 'package:bankcard/assets/constants/images.dart';
import 'package:bankcard/features/common/widgets/w_scale.dart';
import 'package:bankcard/features/common/widgets/w_textfield.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:bankcard/features/main/presentation/widgets/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardEditView extends StatefulWidget {
  const CardEditView(
      {super.key,
      required this.image,
      required this.name,
      required this.number,
      required this.date,
      required this.type,
      required this.price});
  final String image;
  final String name;
  final String number;
  final String date;
  final String type;
  final String price;

  @override
  State<CardEditView> createState() => _CardEditViewState();
}

class _CardEditViewState extends State<CardEditView> {
  late PageController pageController;
  TextEditingController controller = TextEditingController();
  TextEditingController controllerCardNumber = TextEditingController();
  TextEditingController controllerCardCvv = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int select = 0;
  List<String> images = [
    AppImages.image1,
    AppImages.image2,
    AppImages.image3,
    AppImages.image4,
    AppImages.image5,
    AppImages.image6,
    AppImages.image7,
  ];

  @override
  void initState() {
    select = images.indexOf(widget.image);
    pageController = PageController(initialPage: select);
    controller.text = widget.name;
    controllerCardCvv.text = '001';
    controllerCardNumber.text = widget.number;
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
                SizedBox(
                  height: 212,
                  child: PageView.builder(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: images.length,
                    onPageChanged: (value) => setState(() {
                      select = value;
                    }),
                    itemBuilder: (context, index) => BankCard(
                      image: images[index],
                      date: widget.date,
                      name: widget.name,
                      number: widget.number,
                      price: widget.price,
                      type: widget.type,
                      onTap: () {},
                    ),
                  ),
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
                          pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
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
                        child: select == index
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
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        controller: controllerCardCvv,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: MyTextField(controller: dateController),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
