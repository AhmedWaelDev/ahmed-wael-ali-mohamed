import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/opening%20screen.dart';
import 'package:flutter_application_1/screens/start.dart';

void main() {
  runApp(OurQizzTask());
}

class OurQizzTask extends StatelessWidget {
  const OurQizzTask({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: OpeningScreen(),
    );
  }
}
