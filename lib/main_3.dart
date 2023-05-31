// import common used packages
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// main function
void main() {
  // run the app
  runApp(MaterialApp(
    // set the home to MyApp
    home: MyApp(),
  ));
}

// create a stateful widget
class MyApp extends StatefulWidget {
  // create a state
  @override
  _State createState() => _State();
}

// create a simple, empty class _State
class _State extends State<MyApp> {
  Map _countries = Map();

  void _getData() async {
    var url = "http://country.io/names.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() => _countries = jsonDecode(response.body));
      print("Loaded ${_countries.length} countries");
    }
  }

  @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Countries",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.blue)),
              Expanded(
                child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    return Row(
                      children: <Widget>[
                        Text("${key} : ",
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.right),
                        Text(_countries[key]),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
