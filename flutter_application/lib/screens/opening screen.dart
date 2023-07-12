import 'package:flutter/material.dart';

import 'categories.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> myList=[1,1.2,"",true,null];
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height / 3 + 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/4428861.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height / 3 + 40,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 9) {
                          return 'Length must be higher 9 characters';
                        }
                        if (value[0] != value[0].toUpperCase()) {
                          return 'First letter must be uppercase';
                        }
                        return null; // Return null if the input is valid
                      },
                      decoration: InputDecoration(
                        hintText: "UserName",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('are you new?'),
                            TextButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text('Registar'),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => categories()),
                            );
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('');
                    },
                    child: Image.asset(
                      'images/fingerprints.png',
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          Text('Remamber me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text('Forget password'),
                      ),
                    ],
                  ),
                ],
              ),
              width: size.width,
              height: size.height * 2 / 3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
