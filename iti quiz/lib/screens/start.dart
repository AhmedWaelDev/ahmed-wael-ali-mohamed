import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/opening%20screen.dart';

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                Image.asset('assets/images/quiz.png'),
                Text(
                  'ITI Quiz App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  'we are creative enjoy our app ',
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            Container(
              width: size.width / 2,
              margin: EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpeningScreen()),
                  );
                },
                child: Text('Start'),
              ),
            )
          ],
        ),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/crumpled.jpg'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
