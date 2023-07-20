import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filtter_bar_state.dart';

class FiltterBarCubit extends Cubit<FiltterBarState> {
  FiltterBarCubit() : super(FiltterBarInitial());
  int index = -1;
  onpressedUpdate(int i) {
    index = i;
    emit(FiltterBarPressed());
  }
}
