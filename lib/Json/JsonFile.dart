import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ListTilesDataPassing.dart';

class MyJsonCode extends StatefulWidget {
  @override
  State<MyJsonCode> createState() => _MyJsonCodeState();
}

class _MyJsonCodeState extends State<MyJsonCode> {
  List readyData = [];
  late List unfilterData;

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString("assets/JsonData.json");
    setState(() {
      readyData = jsonDecode(jsonText);
    });

    this.unfilterData=readyData;
    return "Succesfully Got Data";
  }

  searchBar(str) {
    var stringExist = str.length > 0 ? true : false;
    if (stringExist) {
      var filterData = [];

      for (int i = 0; i < unfilterData.length; i++) {
        String namee = unfilterData[i]["name"].toUpperCase();

        if (namee.contains(str.toUpperCase())) {
          filterData.add(unfilterData[i]);
        }
        setState(() {
          this.readyData = filterData;
        });
      }
    } else {
      setState(() {
        this.readyData = unfilterData;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadJsonData();
    this.readyData;
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("MyJson"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Search Contact Here",
                icon: Icon(Icons.search),
              ),
              onChanged: (String str) {
                setState(() {
                  this.searchBar(str);
                });
              },
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: readyData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                readyData[index]["name"],
                                style: TextStyle(fontSize: 30),
                              ),
                              subtitle: Text(readyData[index]["phone"]),
                              leading: CircleAvatar(
                                child: Text(readyData[index]["name"][0]),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ListTilesDataPassing(
                                              useLists: readyData[index],
                                            )));
                              },
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    ));
  }
}

