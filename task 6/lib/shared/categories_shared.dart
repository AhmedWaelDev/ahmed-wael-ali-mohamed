import 'package:flutter/material.dart';
import 'package:flutter_application/screens/questions.dart';

class categories_shared extends StatelessWidget {
  final Color color;
  final String text;
  final String cgt_text;
  final Color ct_color;
  final List listName;
  categories_shared({
    super.key,
    required this.color,
    required this.text,
    required this.cgt_text,
    required this.ct_color,
    required this.listName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => question(
                    cat_text: cgt_text,
                    cat_color: ct_color,
                    listName: listName,
                  )),
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
