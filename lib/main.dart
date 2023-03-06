import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:range_picker_app/range_picker_page.dart';
import 'package:range_picker_app/theme.dart';

import 'bloc/fab_toggle_cubit.dart';
import 'bloc/range_input_cubit.dart';

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
        subThemesData: const FlexSubThemesData(
          inputDecoratorRadius: 12,
          blendOnLevel: 3,
        ),
        colors: $myFlexScheme.light,
        fontFamily: GoogleFonts.raleway().fontFamily,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FabToggleCubit>(create: (context) => FabToggleCubit()),
          BlocProvider<RangeInputCubit>(
            create: (context) => RangeInputCubit(
              minRangeController: TextEditingController(),
              maxRangeController: TextEditingController(),
            ),
          )
        ],
        child: RangePickerPage(),
      ),
    );
  }
}
