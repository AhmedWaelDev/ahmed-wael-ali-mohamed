import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/Model/all_news/all_news.dart';
import 'package:news_app/Data/Repositories/All_News_Repo.dart';

part 'Home_cubit_state.dart';

class NewsCubitCubit extends Cubit<NewsCubitState> {
  NewsCubitCubit() : super(NewsCubitInitial());

  getAllNews() {
    emit(NewsCubitLoading());

    AllNewsRepos().getAllNews().then((value) {
      if (value != null) {
        emit(NewsCubitSucsess(ourResponse: value));
      } else {
        emit(NewsCubitErorr());
      }
    });
  }
}
