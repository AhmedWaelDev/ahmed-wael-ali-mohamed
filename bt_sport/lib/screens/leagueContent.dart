import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/cubit/teams/teams_cubit.dart';
import '../helpers/builder/tabViewTeamsContent.dart';
import '../helpers/builder/tabViewTopContent.dart';

class leagueContent extends StatelessWidget {
  final int leagueId;
  const leagueContent({super.key, required this.leagueId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final Color mainColor = Color(0xFFFF5050);
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        height: _size.height,
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
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(tabs: [
                    Tab(
                      child: Text('Teams'),
                    ),
                    Tab(
                      child: Text('Top Scorer'),
                    )
                  ]),
                  Container(
                    height: _size.height * 4 / 5,
                    child: TabBarView(children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 50,
                            width: _size.width - 50,
                            child: TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'search for team...',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      print(
                                          'PlayerSerched: ${searchController.text}');
                                      context.read<TeamsCubit>().refresh(
                                          leagueId, searchController.text);
                                    },
                                    child: Icon(Icons.search)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          tabViewContent(
                              leagueId_: leagueId,
                              mycontroller: searchController.text),
                        ],
                      ),
                      tabViewTopContent(leagueId1: leagueId),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
