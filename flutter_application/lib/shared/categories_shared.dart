
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/questions.dart';

class categories_shared extends StatelessWidget {
  final Color color;
  final String text;
  categories_shared({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => question()),
        );
      },
      child: Container(
        color: color,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    ));
  }
}
