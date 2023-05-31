import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  double _value1 = 20.0;
  double _value2 = 80.0;
  String _value3 = "";

  //___________________________________________________________

  // function to select the time
  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2024),
    );
    if (picked != null) setState(() => _value3 = picked.toString());
  }

  // functions for the range slider min=0 max=100 and interval goes from _value1 to _value2
  void _setValue7(double value) => setState(() => _value1 = value);
  void _setValue8(double value) => setState(() => _value2 = value);

  //___________________________________________________________

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              //functions for the range slider interval goes from _value1 to _value2, min=0 max=100
              RangeSlider(
                values: RangeValues(_value1, _value2),
                onChanged: (RangeValues values) {
                  _setValue7(values.start);
                  _setValue8(values.end);
                },
                min: 0.0,
                max: 100.0,
                divisions: 100,
                labels: RangeLabels(
                  _value1.toString(),
                  _value2.toString(),
                ),
              ),
              Text(_value3),
              ElevatedButton(
                onPressed: _selectDate,
                child: const Text("Select Date"),
              ),

              // add lines here
            ],
          ),
        ),
      ),
    );
  }
}
