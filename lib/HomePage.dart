import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Home Page"),
          backgroundColor: Colors.black12,
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Hello My Top Banner",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
