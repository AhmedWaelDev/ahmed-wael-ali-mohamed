import 'package:flutter/material.dart';
import 'package:flutter_application/questions.dart';

class categories extends StatelessWidget {
  const categories({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => question()),
                );
              },
              child: Container(
                color: Colors.red,
                height: size.height / 3,
                child: Center(
                    child: Text(
                  'Sport Test',
                  style: TextStyle(color: Colors.yellow, fontSize: 30),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => question()),
                );
              },
              child: Container(
                color: Colors.blue,
                height: size.height / 3,
                child: Center(
                    child: Text(
                  'History Test',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => question()),
                );
              },
              child: Container(
                color: Colors.yellow,
                height: size.height / 3,
                child: Center(
                    child: Text(
                  'Geography Test',
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
