import 'package:flutter/material.dart';
import 'package:range_picker_app/range_picker_page_form.dart';

class RangePickerPage extends StatefulWidget {
  RangePickerPage({super.key});

  @override
  State<RangePickerPage> createState() => _RangePickerPageState();
}

class _RangePickerPageState extends State<RangePickerPage> {
  final _formKey = GlobalKey<FormState>();

  final minRangeController = TextEditingController();
  final maxRangeController = TextEditingController();

  bool _isFabEnabled = false;

  void toggleFab(bool value) => setState(() {
        _isFabEnabled = value;
      });

  @override
  void initState() {
    final formCurrentState = _formKey.currentState;
    if (formCurrentState != null) {
      toggleFab(formCurrentState.validate());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Range Picker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: RangePickerForm(
          formKey: _formKey,
          fabToggleCallback: toggleFab,
          minRangeController: minRangeController,
          maxRangeController: maxRangeController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _isFabEnabled
            ? Theme.of(context).floatingActionButtonTheme.backgroundColor
            : const Color(0xFFE0E0E0),
        onPressed: _isFabEnabled ? () {} : null,
        child: Icon(
          Icons.navigate_next,
          color: _isFabEnabled ? Colors.black : Colors.black26,
        ),
      ),
    );
  }
}
