import 'package:flutter/material.dart';
import 'package:flutter_application/global_data/golbal_data.dart';
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
          cgt_text: 'Sport test',
          ct_color: Colors.red,
          listName: sportTest,
        ),
        categories_shared(
          text: 'History test',
          color: Colors.blue,
          cgt_text: 'History test',
          ct_color: Colors.blue,
          listName: historyTest,
        ),
        categories_shared(
          text: 'general test',
          color: Colors.orange,
          cgt_text: 'general test',
          ct_color: Colors.orange,
          listName: genralTest,
        )
      ],
    ));
  }
}
