import 'package:bloc/bloc.dart';

class FabToggleCubit extends Cubit<bool> {
  FabToggleCubit() : super(false);

  void enableFab() => emit(true);
  void disableFab() => emit(false);
}
