// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtra_firebase/Models/user.dart' as Us;
import 'package:xtra_firebase/Services/json_services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Us.user>? user;

  Future<void> _getUserData(String mobile) async {
    var aa = await jsonServices().userLogin(mobile);

    if (aa == null) {
      user = null;
    } else {
      user = aa;
    }
  }

  TextEditingController myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //_getUserData(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                SizedBox(
                  height: 5,
                ),
                Image.asset('lib/images/logo.jpg'),
                SizedBox(height: 10),
                Text(
                  'Please Enter Mobile Number',
                  style: GoogleFonts.rubik(fontSize: 20),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      hintText: 'please enter only numbers',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                MaterialButton(
                    height: 60,
                    elevation: 10,
                    color: Color.fromARGB(255, 34, 169, 191),
                    minWidth: screenheight,
                    onPressed: () {
                      _getUserData(myController.text);
                      if (user == null) {
                        showDialog(
                            context: context,
                            builder: (BuildContext) {
                              return AlertDialog(
                                title: Text('Attention'),
                                content: Text('Invaled User Credentials'),
                              );
                            });
                      }
                      setState(() {});
                    },
                    child: Text(
                      'Login',
                      style:
                          GoogleFonts.rubik(fontSize: 18, color: Colors.white),
                    )),
                SizedBox(height: 20),
                Text(
                  'Welcome ${user?[0].agentName}',
                  style: GoogleFonts.changa(fontSize: 30),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
