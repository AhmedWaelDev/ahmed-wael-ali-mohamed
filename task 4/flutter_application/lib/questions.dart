import 'package:flutter/material.dart';
import 'package:flutter_application/score.dart';

import 'categories.dart';

class question extends StatelessWidget {
  const question({super.key});

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
              MaterialPageRoute(builder: (context) => categories()),
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
      body: Container(
        height: size.height,
        width: size.width,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          child: Center(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Text(
                  'كم مرة يقام كأس العالم في السنة',
                  style: TextStyle(fontSize: 30),
                )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => score()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => score()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => score()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => score()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
