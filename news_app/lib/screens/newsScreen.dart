import 'dart:ui';

import 'package:flutter/material.dart';

class news extends StatelessWidget {
  const news({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {},
          child: Image.asset('assets/images/like.png')),
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/xD.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: size.height * 438 / 812,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Container(
                    padding: EdgeInsets.only(
                        right: 15,
                        left: 15,
                        bottom: 16,
                        top: size.height * 88 / 815),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'London',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  text:
                                      '— Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey')
                            ])),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward 20,000, only to sink as low as 3,122 a year later.',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.” “I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.” Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority. “Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January. “If consumers invest in these types of product, they should be prepared to lose all their money.” Bailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Positioned(
              top: size.height * 295 / 815,
              right: size.width * 35 / 375,
              left: size.width * 35 / 375,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    height: size.height * 141 / 815,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Sunday, 9 May 2021',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2E0505)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Crypto investors should be prepared to lose all their money, BOE governor says',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2E0505)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Published by Ryan Browne',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF2E0505)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: size.height * 52 / 815,
                left: size.width * 15 / 375,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.50),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
