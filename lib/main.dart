import 'package:flutter/material.dart';
import 'package:bloodbanks/screens/home/home.dart';

//import 'package:bloodbanks/screens/wrapper.dart';
//import 'package:bloodbanks/services/auth.dart';

import 'package:provider/provider.dart';
//import 'package:bloodbanks/models/user.dart';

import 'package:bloodbanks/screens/home/search.dart';

import 'package:bloodbanks/services/authservice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Bank',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AuthService().handleAuth(),
    );
  }
}