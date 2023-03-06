import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const $primaryColor = Color(0xFF551217);
const $secondaryColor = Color(0xFFEFD1A8);

final $myFlexScheme = FlexSchemeData(
  name: 'Burgundy and Cream',
  description: 'Burgundy and Cream',
  light: FlexSchemeColor.from(
    primary: $primaryColor,
    secondary: $secondaryColor,
  ),
  dark: FlexSchemeColor.from(
    primary: $primaryColor,
    secondary: $secondaryColor,
  ).toDark(),
);
