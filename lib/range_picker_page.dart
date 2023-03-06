import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:range_picker_app/bloc/fab_toggle_cubit.dart';
import 'package:range_picker_app/bloc/range_input_cubit.dart';
import 'package:range_picker_app/range_generate_page.dart';
import 'package:range_picker_app/range_picker_page_form.dart';

class RangePickerPage extends StatelessWidget {
  const RangePickerPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    final fab = themeContext.floatingActionButtonTheme;
    final fabForegroundColor = fab.foregroundColor;
    final fabBackgroundColor = fab.backgroundColor;
    const fabDisabledBackgroundColor = Color(0xFFE0E0E0);
    final fabDisabledForegroundColor = fabForegroundColor?.withOpacity(.45);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Range Picker'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: RangePickerForm(),
      ),
      floatingActionButton: BlocBuilder<FabToggleCubit, bool>(
        builder: (context, isFabToggled) {
          return FloatingActionButton(
            backgroundColor: isFabToggled ? fabBackgroundColor : fabDisabledBackgroundColor,
            onPressed: isFabToggled ? () => onPressCallback(context) : null,
            child: Icon(
              Icons.navigate_next,
              color: isFabToggled ? fabForegroundColor : fabDisabledForegroundColor,
            ),
          );
        },
      ),
    );
  }

  void onPressCallback(BuildContext context) {
    final rangeInputState = context.read<RangeInputCubit>().state;

    final minLimit = int.parse(rangeInputState.minRangeController.value.text);
    final maxLimit = int.parse(rangeInputState.maxRangeController.value.text);

    if (maxLimit <= minLimit) {
      showDialog(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          title: Text('Alert'),
          content: Text('Please make sure that Maximum range'
              ' is greater than the '
              'minimum and vice versa.'),
        ),
      );

      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => RangeGeneratePage(
          minLimit: minLimit,
          maxLimit: maxLimit,
        ),
      ),
    );
  }
}
