part of 'Home_Cubit.dart';

@immutable
abstract class NewsCubitState {}

class NewsCubitInitial extends NewsCubitState {}

class NewsCubitLoading extends NewsCubitState {}

class NewsCubitErorr extends NewsCubitState {}

class NewsCubitSucsess extends NewsCubitState {
  final AllNews ourResponse;
  NewsCubitSucsess({required this.ourResponse});
}
