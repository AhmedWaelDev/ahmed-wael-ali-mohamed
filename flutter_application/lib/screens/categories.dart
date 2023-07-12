import 'package:flutter/material.dart';
import 'package:flutter_application/screens/questions.dart';

import '../shared/categories_shared.dart';

class categories extends StatelessWidget {
  const categories({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        categories_shared(
          text: 'Sport test',
          color: Colors.red,
        ),
        categories_shared(
          text: 'History test',
          color: Colors.blue,
        ),
        categories_shared(
          text: 'general test',
          color: Colors.yellow,
        )
      ],
    ));
  }
}
