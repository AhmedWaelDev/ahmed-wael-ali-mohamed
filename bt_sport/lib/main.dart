import 'package:bt_sport/data/cubit/players/players_cubit.dart';
import 'package:bt_sport/screens/spalsh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/cubit/TopScorer/top_scorer_cubit.dart';
import 'data/cubit/allCountries/all_countries_cubit.dart';
import 'data/cubit/allLeagues/all_leagues_cubit.dart';
import 'data/cubit/teams/teams_cubit.dart';

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
        BlocProvider(
          create: (context) => AllCountriesCubit(),
        ),
        BlocProvider(
          create: (context) => AllLeaguesCubit(),
        ),
        BlocProvider(
          create: (context) => TopScorerCubit(),
        ),
        BlocProvider(
          create: (context) => TeamsCubit(),
        ),
        BlocProvider(
          create: (context) => PlayersCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'BT SPORT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFF5050)),
          useMaterial3: true,
        ),
        home: const splash(),
      ),
    );
  }
}
