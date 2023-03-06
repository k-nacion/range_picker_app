import 'dart:math';

import 'package:flutter/material.dart';

class RangeGeneratePage extends StatefulWidget {
  const RangeGeneratePage({
    required this.minLimit,
    required this.maxLimit,
    super.key,
  });

  final int minLimit;
  final int maxLimit;

  @override
  State<RangeGeneratePage> createState() => _RangeGeneratePageState();
}

class _RangeGeneratePageState extends State<RangeGeneratePage> {
  bool _isVisible = false;
  int randomNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: _isVisible,
                child: Text(
                  '$randomNumber',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVisible = true;

                    randomNumber =
                        Random().nextInt(widget.maxLimit - widget.minLimit) + widget.minLimit;
                  });
                },
                child: const Text('Generate random Number'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
