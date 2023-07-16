import 'package:flutter/material.dart';
import 'package:flutter_application/screens/opening%20screen.dart';
import 'package:flutter_application/screens/start.dart';

class score extends StatelessWidget {
  final int Index;
  final int Score;
  const score({super.key, required this.Index, required this.Score});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      userNameTextEditingControllrt.text,
                      style: TextStyle(fontSize: 60, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Text('your score is',
                    style: TextStyle(
                      fontSize: 60,
                    )),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              '${Score}/${Index + 1}',
              style: TextStyle(fontSize: 50),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => start()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(
                    color: Colors.orange, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
