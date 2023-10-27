// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtra_firebase/Pages/login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController apiUrlController = TextEditingController();
  String? APIUrl;

  Future<void> _getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      APIUrl = prefs.getString('APIUrl');
      apiUrlController.text = '$APIUrl';
    });
  }

  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("APIUrl", apiUrlController.text);
    setState(() {
      APIUrl = prefs.getString('APIUrl');
      apiUrlController.text = '$APIUrl';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            await _saveSettings();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        appBar: AppBar(title: const Text('App Settings')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/images/server.jpg'),
                TextField(
                  controller: apiUrlController,
                  decoration: InputDecoration(
                      hintText: 'Enter API URL Here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
