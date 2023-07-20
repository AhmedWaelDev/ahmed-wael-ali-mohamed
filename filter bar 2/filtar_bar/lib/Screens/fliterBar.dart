import 'package:filtar_bar/Screens/checkboxs.dart';
import 'package:filtar_bar/Screens/day_14.dart';
import 'package:filtar_bar/builder/builder.dart';
import 'package:filtar_bar/data/cubit/filtter_bar/filtter_bar_cubit.dart';
import 'package:flutter/material.dart';
import '../builder/switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'passwordVisiblity.dart';

int active = 0;

class filterbar extends StatelessWidget {
  const filterbar({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: BlocBuilder<FiltterBarCubit, FiltterBarState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          for (int i = 0; i < itemList.length; i++)
                            Container(
                              height: 50,
                              width: 100,
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<FiltterBarCubit>()
                                      .onpressedUpdate(i);
                                },
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: context
                                                    .read<FiltterBarCubit>()
                                                    .index ==
                                                i
                                            ? Colors.red
                                            : Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all()),
                                    child: Center(child: Text(itemList[i]))),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                BlocBuilder<FiltterBarCubit, FiltterBarState>(
                  builder: (context, state) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                          getSelected(context.read<FiltterBarCubit>().index)),
                    );
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => checkBox()));
                      },
                      child: Text('CheckBox task')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => passwordVisiblity()));
                      },
                      child: Text('Password visibility task'))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Day14()));
                  },
                  child: Text('Day 14 task'))
            ],
          )
        ],
      ),
    );
  }

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
