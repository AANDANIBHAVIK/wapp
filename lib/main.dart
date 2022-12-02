import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wapp/provider/homeprovider.dart';
import 'package:wapp/view/homeScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Home_Provider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home_Screen(),
      },
    ),
  ));
}
