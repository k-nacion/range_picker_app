part of 'range_input_cubit.dart';

class RangeInputState extends Equatable {
  final TextEditingController minRangeController;
  final TextEditingController maxRangeController;

  const RangeInputState({
    required this.minRangeController,
    required this.maxRangeController,
  });

  @override
  List<Object> get props => [minRangeController, maxRangeController];

  RangeInputState copyWith({
    TextEditingController? minRangeController,
    TextEditingController? maxRangeController,
  }) {
    return RangeInputState(
      minRangeController: minRangeController ?? this.minRangeController,
      maxRangeController: maxRangeController ?? this.maxRangeController,
    );
  }
}
