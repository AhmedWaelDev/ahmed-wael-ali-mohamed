import 'package:filtar_bar/data/cubit/checkBox/check_box_cubit.dart';
import 'package:filtar_bar/data/cubit/filtter_bar/filtter_bar_cubit.dart';
import 'package:filtar_bar/data/cubit/visability/visability_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/fliterBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FiltterBarCubit>(
          create: (context) => FiltterBarCubit(),
        ),
        BlocProvider<VisabilityCubit>(
          create: (context) => VisabilityCubit(),
        ),
        BlocProvider<CheckBoxCubit>(
          create: (context) => CheckBoxCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Filter Bar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const filterbar(),
      ),
    );
  }
}
