import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/cubit/allCountries/all_countries_cubit.dart';
import 'LeaguesScreen.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color mainColor = Color(0xFFFF5050);
    final Color secondColor = Color(0xffADABAB);
    context.read<AllCountriesCubit>().getAllCountries();
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
          Text(
            'Countries',
            style: GoogleFonts.poppins(
                color: mainColor,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: secondColor,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]),
          ),
          Expanded(
            child: BlocBuilder<AllCountriesCubit, AllCountriesState>(
              builder: (context, state) {
                if (state is AllCountriesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AllCountriesSuccess) {
                  return GridView.builder(
                    itemCount: state.countriesResponse.result!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LeaguesScreen(
                                  countryName: state.countriesResponse
                                      .result![index].countryName!,
                                  countryId: state.countriesResponse
                                      .result![index].countryKey!),
                            ),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Expanded(
                                    child: state.countriesResponse
                                                .result![index].countryLogo ==
                                            null
                                        ? Container(
                                            width: 200,
                                            color: mainColor,
                                            child: Center(
                                                child: Text(
                                              'No Image',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))
                                        : Image.network(state.countriesResponse
                                            .result![index].countryLogo!)),
                                Text(
                                  state.countriesResponse.result![index]
                                      .countryName!,
                                  style: GoogleFonts.poppins(),
                                )
                              ],
                            )),
                      );
                    },
                  );
                } else if (state is AllCountriesErorr) {
                  return Center(
                    child: Text('Error'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    ));
  }
}
