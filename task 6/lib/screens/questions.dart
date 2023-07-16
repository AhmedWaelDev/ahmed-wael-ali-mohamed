import 'package:flutter/material.dart';
import 'package:flutter_application/global_data/golbal_data.dart';
import 'package:flutter_application/screens/score.dart';

import 'categories.dart';

class question extends StatefulWidget {
  final String cat_text;
  final Color cat_color;
  final List listName;
  const question(
      {super.key,
      required this.cat_text,
      required this.cat_color,
      required this.listName});

  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {
  int index = 0;
  int theScore = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.cat_color,
        toolbarHeight: size.height / 8,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              widget.cat_text,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              height: (size.height / 8) / 4,
            ),
            Text(
              '${index + 1}/${widget.listName.length}',
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
                    color: widget.cat_color,
                    border: Border.all(
                      color: widget.cat_color, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.listName[index]["question"],
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )),
              ),
              for (int i = 0;
                  i < (widget.listName[index]["answer"] as List).length;
                  i++)
                InkWell(
                  onTap: () {
                    theScore = theScore +
                        widget.listName[index]["answer"][i]["score"] as int;
                    if (index == widget.listName.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => score(
                                  Score: theScore,
                                  Index: index,
                                )),
                      );
                    } else {
                      setState(() {
                        index++;
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.cat_color, // Border color
                          width: 2.0, // Border width
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      widget.listName[index]["answer"][i]["ans"],
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
