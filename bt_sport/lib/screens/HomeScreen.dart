import 'package:bt_sport/helpers/Lists/HomeList.dart';
import 'package:bt_sport/screens/CountriesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color mainColor = Color(0xFFFF5050);
    final Color secondColor = Color(0xffADABAB);
    final Color thirdColor = Color(0xffD6D5D5);
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: _size.height * 1 / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: mainColor,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/Logo.svg', height: 30),
                      Text(
                        'BT SPORT',
                        style: GoogleFonts.poppins(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: _size.height / 2 - _size.height * 1 / 15),
                itemBuilder: (context, index) {
                  return Expanded(
                      child: InkWell(
                    onTap: () {
                      index != 0
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(child: Text('Coming Soon ...')),
                                  content:
                                      Text('This section is unavilavle now'),
                                );
                              })
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountriesScreen(),
                              ),
                            );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: secondColor,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            HomeList[index]['image'],
                          ),
                          Text(
                            HomeList[index]['name'],
                            style: GoogleFonts.poppins(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
