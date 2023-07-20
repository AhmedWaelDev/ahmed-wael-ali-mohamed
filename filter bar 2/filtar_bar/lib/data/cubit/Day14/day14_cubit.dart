import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'day14_state.dart';

class Day14Cubit extends Cubit<Day14State> {
  Day14Cubit() : super(Day14Initial());
  int index = 3;

  EnterTraining(int j) {
    index = j;
    emit(Day14Initial());
  }
}
