import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/cubit/TopScorer/top_scorer_cubit.dart';

class tabViewTopContent extends StatelessWidget {
  final int leagueId1;
  const tabViewTopContent({super.key, required this.leagueId1});

  @override
  Widget build(BuildContext context) {
    context.read<TopScorerCubit>().getTopScorer(leagueId1);
    return BlocBuilder<TopScorerCubit, TopScorerState>(
      builder: (context, state) {
        if (state is TopScorerReload) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopScorerSuccess) {
          return state.TopScorerResponse.result?.length == null
              ? Expanded(
                  child: Center(
                  child: Text(
                    "NO Data",
                    style: GoogleFonts.poppins(fontSize: 50),
                  ),
                ))
              : Expanded(
                  child: ListView.builder(
                  itemCount: state.TopScorerResponse.result!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '#${index + 1}',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  state.TopScorerResponse.result![index]
                                      .playerName!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Text(
                            '${state.TopScorerResponse.result![index].goals!}',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                ));
        } else if (state is TopScorerError) {
          return Center(
            child: Text('Error'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
