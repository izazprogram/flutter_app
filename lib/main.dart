import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Json/JsonFile.dart';


void main() {
  runApp( MyJson());
}
class MyJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold(
        body: MyJsonCode(),
      )),
    );
  }
}

