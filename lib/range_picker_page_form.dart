import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class RangePickerForm extends StatelessWidget {
  RangePickerForm({
    required GlobalKey<FormState> formKey,
    required this.minRangeController,
    required this.maxRangeController,
    required this.fabToggleCallback,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController minRangeController;
  final TextEditingController maxRangeController;
  void Function(bool) fabToggleCallback;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => fabToggleCallback(_formKey.currentState!.validate()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Minimum range', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8),
          _buildTextFormField(controller: minRangeController),
          const SizedBox(height: 8),
          Text('Maximum range', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8),
          _buildTextFormField(controller: maxRangeController),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField({required TextEditingController controller}) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(signed: true),
      validator: _validator,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  String? _validator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Field is required.';
      }
      if (!isNumeric(value)) {
        return 'Must be whole number only.';
      }
    }
    return null;
  }
}
