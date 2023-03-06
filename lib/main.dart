import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:range_picker_app/range_picker_page.dart';
import 'package:range_picker_app/theme.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Range Picker',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        swapColors: true,
        subThemesData: const FlexSubThemesData(),
        // scheme: FlexScheme.indigo,
        colors: $myFlexScheme.light,
        fontFamily: GoogleFonts.raleway().fontFamily,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
      ) /*ThemeData()*/,
      home: RangePickerPage(),
    );
  }
}
