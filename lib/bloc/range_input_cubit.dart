import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'range_input_state.dart';

class RangeInputCubit extends Cubit<RangeInputState> {
  RangeInputCubit({
    required TextEditingController minRangeController,
    required TextEditingController maxRangeController,
  }) : super(RangeInputState(
          minRangeController: minRangeController,
          maxRangeController: maxRangeController,
        ));

  void onMinRangeChange(String newValue) =>
      emit(state.copyWith(minRangeController: state.minRangeController..text = newValue));

  void onMaxRangeChange(String newValue) =>
      emit(state.copyWith(maxRangeController: state.maxRangeController..text = newValue));
}
