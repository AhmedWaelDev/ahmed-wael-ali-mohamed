import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:news_app/Data/Model/all_news/all_news.dart';

class news extends StatelessWidget {
  final AllNews ourResponse;
  final newsIndex;
  const news({super.key, required this.newsIndex, required this.ourResponse});

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
                      image: NetworkImage(
                          ourResponse.articles![newsIndex].urlToImage!),
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
                                text: ourResponse.articles![newsIndex].title!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  text:
                                      ourResponse.articles![newsIndex].content!)
                            ])),
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
                    height: size.height * 154 / 815,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                ourResponse.articles![newsIndex].publishedAt!,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2E0505)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                ourResponse.articles![newsIndex].title!,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2E0505)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Published by ${ourResponse.articles![newsIndex].author!}',
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
