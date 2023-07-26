import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/Cubit/home/cubit/Home_Cubit.dart';
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
          Container(
            child: Center(
              child: (ElevatedButton(
                  onPressed: () {
                    context.read<NewsCubitCubit>().getAllNews();
                  },
                  child: Text('Get News'))),
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsCubitCubit, NewsCubitState>(
              builder: (context, state) {
                if (state is NewsCubitInitial) {
                  return Center(child: Text('press to get news'));
                } else if (state is NewsCubitLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsCubitSucsess) {
                  return ListView.builder(
                      itemCount: state.ourResponse.articles!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => news(
                                    ourResponse: state.ourResponse,
                                    newsIndex:
                                        index), // The screen you want to navigate to
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            height: size.height * 240 / 812,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(state.ourResponse
                                        .articles![index].urlToImage!),
                                    fit: BoxFit.cover)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Text(
                                    state.ourResponse.articles![index].author!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    state.ourResponse.articles![index].title!,
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
                                    state.ourResponse.articles![index]
                                        .description!,
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
                        );
                      });
                } else {
                  return Container();
                }
              },
            ),
          )
        ]),
      )),
    );
  }
}
