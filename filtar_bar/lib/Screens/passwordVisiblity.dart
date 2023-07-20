import 'package:filtar_bar/Screens/checkboxs.dart';
import 'package:filtar_bar/Screens/fliterBar.dart';
import 'package:filtar_bar/data/cubit/visability/visability_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class passwordVisiblity extends StatelessWidget {
  const passwordVisiblity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: BlocBuilder<VisabilityCubit, VisabilityState>(
              builder: (context, state) {
                return TextField(
                    obscureText: context.read<VisabilityCubit>().passObscure,
                    decoration: InputDecoration(
                        suffix: context.read<VisabilityCubit>().passObscure ==
                                true
                            ? InkWell(
                                onTap: () {
                                  context.read<VisabilityCubit>().UpdateIcon();
                                },
                                child: Icon(Icons.visibility_off),
                              )
                            : InkWell(
                                onTap: () {
                                  context.read<VisabilityCubit>().UpdateIcon();
                                },
                                child: Icon(Icons.visibility),
                              )));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => checkBox()));
                  },
                  child: Text('CheckBox task')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => filterbar()));
                  },
                  child: Text('filterBar task'))
            ],
          )
        ],
      ),
    );
  }
}
