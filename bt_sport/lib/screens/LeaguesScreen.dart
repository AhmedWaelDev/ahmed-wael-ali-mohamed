import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/cubit/allLeagues/all_leagues_cubit.dart';
import 'leagueContent.dart';

class LeaguesScreen extends StatelessWidget {
  final int countryId;
  final String countryName;
  const LeaguesScreen(
      {super.key, required this.countryId, required this.countryName});

  @override
  Widget build(BuildContext context) {
    final Color mainColor = Color(0xFFFF5050);
    final Color secondColor = Color(0xffADABAB);
    final Color thirdColor = Color(0xffD6D5D5);
    var _size = MediaQuery.of(context).size;
    context.read<AllLeaguesCubit>().getAllLeagues(countryId);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: _size.height * 1 / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: mainColor,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/Logo.svg', height: 30),
                    Text(
                      'BT SPORT',
                      style: GoogleFonts.poppins(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
          Text(
            '${countryName} Leagues',
            style: GoogleFonts.poppins(
                color: mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: secondColor,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]),
          ),
          Expanded(
            child: BlocBuilder<AllLeaguesCubit, AllLeaguesState>(
              builder: (context, state) {
                if (state is AllLeaguesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AllLeaguesSuccess) {
                  return ListView.builder(
                    itemCount: state.leaguesResponse.result!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => leagueContent(
                                    leagueId: state.leaguesResponse
                                        .result![index].leagueKey!),
                              ),
                            );
                          },
                          child: Container(
                              height: 250,
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
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: state.leaguesResponse
                                                  .result![index].leagueLogo ==
                                              null
                                          ? Center(
                                              child: Image.asset(
                                                'assets/images/defaultLeague.png',
                                                height: 100,
                                              ),
                                            )
                                          : Image.network(
                                              state.leaguesResponse
                                                  .result![index].leagueLogo!,
                                              height: 100,
                                            )),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(),
                                      Text(
                                        state.leaguesResponse.result![index]
                                            .leagueName!,
                                        style: GoogleFonts.poppins(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        countryName,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  );
                } else if (state is AllLeaguesErorr) {
                  return Center(
                    child: Text('Error'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    ));
  }
}
