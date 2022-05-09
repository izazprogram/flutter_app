import 'package:flutter/material.dart';

class ListTilesDataPassing extends StatefulWidget {
  var useLists;
  ListTilesDataPassing({required this.useLists});

  @override
  State<ListTilesDataPassing> createState() => _ListTilesDataPassingState();
}
class _ListTilesDataPassingState extends State<ListTilesDataPassing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text("Data View"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                " ${widget.useLists["name"]}",
                style: TextStyle(fontSize: 40),
              ),
              Text(
                "${widget.useLists["phone"]}",
                style: TextStyle(fontSize: 30),
              ),

            ],
          ),
        ),
      ),
    );
  }
}