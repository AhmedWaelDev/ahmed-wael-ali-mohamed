import 'package:flutter/material.dart';
import 'package:flutter_application/questions.dart';

import 'categories.dart';

class score extends StatelessWidget {
  const score({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height / 8,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => question()),
            );
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Sport Test',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              height: (size.height / 8) / 4,
            ),
            Text(
              '1/50',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        actions: [Container(width: 60, child: Image.asset('images/logo.png'))],
      ),
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
                      "Ahmed",
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
              '5/10',
              style: TextStyle(fontSize: 50),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => categories()),
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
