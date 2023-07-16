import 'package:filtar_bar/builder/builder.dart';
import 'package:flutter/material.dart';

import '../builder/switch.dart';

int active = 0;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    int index;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < itemList.length; i++)
                    Container(
                      height: 50,
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            active = i;
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: active == i ? Colors.red : Colors.grey,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all()),
                            child: Center(child: Text(itemList[i]))),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Text(getSelected(active)),
            )
          ],
        ),
      ),
    );
  }
}
