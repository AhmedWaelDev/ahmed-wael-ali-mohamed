import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'visability_state.dart';

class VisabilityCubit extends Cubit<VisabilityState> {
  VisabilityCubit() : super(VisabilityUpdate());
  bool passObscure = false;
  UpdateIcon() {
    passObscure = !passObscure;

    emit(VisabilityUpdate());
  }
}
