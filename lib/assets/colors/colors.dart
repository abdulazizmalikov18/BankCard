import 'package:bankcard/assets/constants/images.dart';
import 'package:flutter/material.dart';

const white = Color(0xFFFFFFFF);

const red = Color(0xffC8534D);

List<LinearGradient> colors = [
  const LinearGradient(
    colors: [Colors.green, Colors.greenAccent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
  const LinearGradient(
    colors: [Colors.red, Colors.yellow],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
  const LinearGradient(
    colors: [Colors.blue, Colors.lightBlueAccent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
  const LinearGradient(
    colors: [Colors.yellow, Colors.greenAccent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
  const LinearGradient(
    colors: [Colors.pink, Colors.pinkAccent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
  const LinearGradient(
    colors: [Colors.purple, Colors.lightBlue],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
  const LinearGradient(
    colors: [Colors.amber, Colors.red],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
];

List<String> images = [
  AppImages.image1,
  AppImages.image2,
  AppImages.image3,
  AppImages.image4,
  AppImages.image5,
  AppImages.image6,
  AppImages.image7,
];
