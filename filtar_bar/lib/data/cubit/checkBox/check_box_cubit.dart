import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_box_state.dart';

class CheckBoxCubit extends Cubit<CheckBoxState> {
  CheckBoxCubit() : super(SelectedRadioChanged());
  int selected = 0;
  changeSelected(int i) {
    selected = i;
    emit(SelectedRadioChanged());
  }
}
