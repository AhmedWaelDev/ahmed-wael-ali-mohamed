import 'package:flutter/material.dart';
import 'package:news_app/screens/newsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 42,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 12),
                    hintText: "Dogecoin to the Moon...",
                    suffixIcon: Image.asset('assets/images/Vector.png'),
                    border: OutlineInputBorder(),
                  ),
                ),
              )),
              Container(
                height: 43,
                width: 42,
                margin: EdgeInsets.only(left: 16),
                decoration:
                    BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
                child: Image.asset('assets/images/Group38.png'),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest News',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All ',
                          style: TextStyle(
                            color: Color(0xFF0080FF),
                          ),
                        )),
                    Image.asset('assets/images/Shape.png'),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            news(), // The screen you want to navigate to
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: size.height * 240 / 812,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/images/xD.png'),
                            fit: BoxFit.cover)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 80 / 812,
                          ),
                          Text(
                            'by Ryan Browne',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Crypto investors should be prepared to lose all their money, BOE governor says',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 31 / 812,
                          ),
                          Text(
                            '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
