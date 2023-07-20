import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class opningScreen extends StatelessWidget {
  const opningScreen({super.key});

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
                Image.asset('images/quiz.png'),
                Text(
                  'ITI Quiz App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'we are creative enjoy our app ',
                  style: GoogleFonts.yatraOne(
                      textStyle: TextStyle(
                          color: Colors.cyan, letterSpacing: 1, fontSize: 20)),
                ),
              ],
            ),
            Container(
              width: size.width / 2,
              margin: EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {},
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => OpeningScreen()),
                //   );
                // },
                child: Text('Start'),
              ),
            )
          ],
        ),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/crumpled.jpg'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
