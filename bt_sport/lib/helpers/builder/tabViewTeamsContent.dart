import 'package:bt_sport/screens/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/cubit/teams/teams_cubit.dart';

class tabViewContent extends StatelessWidget {
  final String mycontroller;
  final int leagueId_;
  const tabViewContent(
      {super.key, required this.leagueId_, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    final Color secondColor = Color(0xffADABAB);
    context.read<TeamsCubit>().getAllTeams(leagueId_, mycontroller);
    return BlocBuilder<TeamsCubit, TeamsState>(
      builder: (context, state) {
        if (state is TeamsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TeamsSuccess) {
          return Expanded(
              child: state.TeamsResponse.result?.length == null
                  ? Container(
                      margin: EdgeInsets.all(50),
                      child: Text(
                        'No team with this name',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ))
                  : ListView.builder(
                      itemCount: state.TeamsResponse.result!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => team(
                                    teamId: state
                                        .TeamsResponse.result![index].teamKey!),
                              ),
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: secondColor,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(state.TeamsResponse
                                            .result![index].teamLogo!)),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 35),
                                      child: Text(
                                        state.TeamsResponse.result![index]
                                            .teamName!,
                                        style: GoogleFonts.poppins(
                                            color: Color(0xFFFF5050),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'players num: ${state.TeamsResponse.result![index].players!.length}',
                                      style: GoogleFonts.poppins(),
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                    ));
        } else if (state is TeamsError) {
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
