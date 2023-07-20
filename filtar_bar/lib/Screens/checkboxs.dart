import 'package:filtar_bar/Screens/fliterBar.dart';
import 'package:filtar_bar/Screens/passwordVisiblity.dart';
import 'package:filtar_bar/data/cubit/checkBox/check_box_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class checkBox extends StatelessWidget {
  const checkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            margin: EdgeInsets.all(20),
            child: BlocBuilder<CheckBoxCubit, CheckBoxState>(
              builder: (context, state) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: index,
                      groupValue: context.read<CheckBoxCubit>().selected,
                      title: Text("radio ${index + 1}"),
                      subtitle:
                          Text("hello this is radio button no. ${index + 1}"),
                      onChanged: (value) {
                        context.read<CheckBoxCubit>().changeSelected(value!);
                      },
                    );
                  },
                  itemCount: 20,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => passwordVisiblity()));
                  },
                  child: Text('Password visibility task')),
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
