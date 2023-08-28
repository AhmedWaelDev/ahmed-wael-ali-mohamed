import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/cubit/players/players_cubit.dart';

class team extends StatelessWidget {
  final int teamId;
  const team({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    context.read<PlayersCubit>().getAllPlayers(teamId, searchController.text);

    final Color mainColor = Color(0xFFFF5050);
    final Color secondColor = Color(0xffADABAB);
    final Color thirdColor = Color(0xffD6D5D5);
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            'Players',
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 50,
            width: _size.width - 50,
            child: TextFormField(
              controller: searchController,
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'search for player...',
                suffixIcon: InkWell(
                    onTap: () {
                      print('PlayerSerched: ${searchController.text}');
                      context
                          .read<PlayersCubit>()
                          .refresh(teamId, searchController.text);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(child: BlocBuilder<PlayersCubit, PlayersState>(
            builder: (context, state) {
              if (state is playerLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is playerSuccess) {
                return state.playerResponse.result?.length == null
                    ? Center(
                        child: Text('no players found'),
                      )
                    : ListView.builder(
                        itemCount: state.playerResponse.result!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: _size.width,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
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
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Center(
                                            child: Text(state.playerResponse
                                                .result![index].playerName!)),
                                        content: Container(
                                          height: 500,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    'assets/images/default.png'),
                                                Text(
                                                    'number: ${state.playerResponse.result![index].playerNumber == null ? "unKnown" : state.playerResponse.result![index].playerNumber}'),
                                                Text(
                                                    'age: ${state.playerResponse.result![index].playerAge == null ? "unKnown" : state.playerResponse.result![index].playerAge}'),
                                                Text(
                                                    'country: ${state.playerResponse.result![index].playerCountry == null ? "unKnown" : state.playerResponse.result![index].playerCountry}'),
                                                Text(
                                                    'yellow cards num: ${state.playerResponse.result![index].playerYellowCards == null ? "unKnown" : state.playerResponse.result![index].playerYellowCards}'),
                                                Text(
                                                    'red cards num: ${state.playerResponse.result![index].playerRedCards == null ? "unKnown" : state.playerResponse.result![index].playerRedCards}'),
                                                Text(
                                                    'goals: ${state.playerResponse.result![index].playerGoals == null ? "unKnown" : state.playerResponse.result![index].playerGoals}'),
                                                Text(
                                                    'assists: ${state.playerResponse.result![index].playerAssists == null ? "unKnown" : state.playerResponse.result![index].playerAssists}'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    state.playerResponse.result?[index]
                                                .playerImage ==
                                            null
                                        ? Image.asset(
                                            'assets/images/default.png',
                                            height: 100,
                                          )
                                        : Image.network(
                                            state.playerResponse.result![index]
                                                .playerImage!,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/default.png',
                                                height: 100,
                                              );
                                            },
                                          ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 45),
                                      child: Text(
                                        '${state.playerResponse.result![index].playerName}',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: mainColor),
                                      ),
                                    ),
                                    Text(
                                        '${state.playerResponse.result![index].playerType == null ? 'unKnown:' : state.playerResponse.result![index].playerType}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              } else if (state is playerError) {
                return Center(
                  child: Text('Error'),
                );
              } else {
                return Container();
              }
              ;
            },
          ))
        ],
      )),
    );
  }
}
