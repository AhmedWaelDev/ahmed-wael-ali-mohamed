import 'package:bt_sport/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

import '../helpers/Lists/onboardingPageView.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color mainColor = Color(0xFFFF5050);
    final Color thirdColor = Color(0xffD6D5D5);
    final _controller = PageController();
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Container(
              height: _size.height,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) async {
                  if (index != 2) {
                    await Future.delayed(Duration(seconds: 3));
                    _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  } else {
                    await Future.delayed(Duration(seconds: 3));
                    _controller.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: thirdColor,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: _size.height / 6,
                          bottom: _size.height / 6,
                          left: 10,
                          right: 10),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 16),
                              child: Text(
                                onboardinglist[index]["name"],
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor),
                              )),
                          Container(
                              child: Text(
                            onboardinglist[index]["discreption"],
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                            ),
                          )),
                          Expanded(
                              child:
                                  Image.asset(onboardinglist[index]["image"]))
                        ],
                      ));
                },
              ),
            ),
            Container(
                alignment: Alignment(0, 0.90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xFFFF5050)),
                      controller: _controller,
                      count: 3,
                      onDotClicked: (index) {
                        _controller.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'skip  ',
                              style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: mainColor,
                            )
                          ],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
