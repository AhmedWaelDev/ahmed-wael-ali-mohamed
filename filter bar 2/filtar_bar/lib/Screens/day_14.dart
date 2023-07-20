import 'package:filtar_bar/Screens/checkboxs.dart';
import 'package:filtar_bar/Screens/fliterBar.dart';
import 'package:filtar_bar/Screens/passwordVisiblity.dart';
import 'package:filtar_bar/data/cubit/Day14/day14_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> myButtonList = [
  'Enter the training',
  'Exit the training',
  'Hold the training',
  'Write a commint about training'
];
List<String> myCallList = [
  'You entered the training',
  'You exited the training',
  'You holded the training',
  ""
];

class Day14 extends StatelessWidget {
  const Day14({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Day14Cubit, Day14State>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    for (int i = 0; i < myButtonList.length; i++)
                      ElevatedButton(
                          onPressed: () {
                            context.read<Day14Cubit>().EnterTraining(i);
                          },
                          child: Text(myButtonList[i])),
                  ],
                ),
                context.read<Day14Cubit>().index == 3
                    ? TextFormField()
                    : Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Text(
                          myCallList[context.read<Day14Cubit>().index],
                          style: TextStyle(color: Colors.white),
                        )),
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
                                      builder: (context) =>
                                          passwordVisiblity()));
                            },
                            child: Text('Password visibility task'))
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => filterbar()));
                        },
                        child: Text('filterbar task'))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
