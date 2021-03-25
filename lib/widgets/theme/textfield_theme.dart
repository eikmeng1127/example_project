import 'package:flutter/material.dart';
import '../../others/constants.dart';

OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: AppColors.textFieldMain,
    width: 2.0,
  ),
  gapPadding: 20,
);

OutlineInputBorder enabledBorderTheme = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.grey,
    width: 2.0,
  ),
  gapPadding: 20,
);

OutlineInputBorder focusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: AppColors.textFieldMain,
    width: 2.0,
  ),
  gapPadding: 20,
);

OutlineInputBorder errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.red,
    width: 2.0,
  ),
  gapPadding: 20,
);