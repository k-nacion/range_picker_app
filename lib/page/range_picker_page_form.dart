import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:range_picker_app/bloc/fab_toggle_cubit.dart';
import 'package:range_picker_app/bloc/range_input_cubit.dart';
import 'package:string_validator/string_validator.dart';

class RangePickerForm extends StatelessWidget {
  const RangePickerForm({super.key});

  @override
  Widget build(BuildContext context) {
    final rangeInputCubit = context.read<RangeInputCubit>();
    final fabToggleCubit = context.read<FabToggleCubit>();

    final minRangeController = rangeInputCubit.state.minRangeController;
    final maxRangeController = rangeInputCubit.state.maxRangeController;

    final themeContext = Theme.of(context);
    final minTextLabelStyle = themeContext.textTheme.bodyLarge;

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Minimum range', style: minTextLabelStyle),
          const SizedBox(height: 8),
          _buildTextFormField(
            formKey: formKey,
            controller: minRangeController,
            fabToggleCubit: fabToggleCubit,
          ),
          const SizedBox(height: 8),
          Text('Maximum range', style: minTextLabelStyle),
          const SizedBox(height: 8),
          _buildTextFormField(
            formKey: formKey,
            controller: maxRangeController,
            fabToggleCubit: fabToggleCubit,
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField({
    required GlobalKey<FormState> formKey,
    required FabToggleCubit fabToggleCubit,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(signed: true),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => _onValidate(
        fabToggleCubit: fabToggleCubit,
        value: value,
      ),
      onChanged: (value) => _onChange(
        key: formKey,
        fabToggle: fabToggleCubit,
        value: value,
      ),
    );
  }

  String? _onValidate({
    required FabToggleCubit fabToggleCubit,
    required String? value,
  }) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Field is required.';
      }
      if (!isNumeric(value)) {
        return 'Must be whole number only.';
      }
    } else if (value == null) {
      return 'Field is required.';
    }

    return null;
  }

  void _onChange({
    required GlobalKey<FormState> key,
    required FabToggleCubit fabToggle,
    required String value,
  }) {
    if (value.isEmpty) {
      fabToggle.disableFab();
    } else {
      if (key.currentState!.validate()) {
        fabToggle.enableFab();
      }
    }
  }
}
