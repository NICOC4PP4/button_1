import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  int _value = 0;
  String click = 'Click me';
  String _value2 = "";
  bool? _value3 = false;
  bool _value4 = false;
  int _value5 = 0;
  int _value6 = 0;
  double _value7 = 20.0;
  double _value8 = 80.0;
  String _value9 = "";

  //___________________________________________________________

  // function to select the time
  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2024),
    );
    if (picked != null) setState(() => _value9 = picked.toString());
  }

  // functions for the range slider min=0 max=100 and interval goes from _value7 to _value8
  void _setValue7(double value) => setState(() => _value7 = value);
  void _setValue8(double value) => setState(() => _value8 = value);

  // functions for the radio buttons
  void _setValue5(int? value) => setState(() => _value5 = value!);
  void _setValue6(int? value) => setState(() => _value6 = value!);

  // functions to change the value of the booleans
  void _value3Changed(bool? value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);

  // functions to change the value of the text field
  void _onChange(String value) {
    setState(() {
      _value2 = "Change: $value";
    });
  }

  void _onSubmit(String value) {
    setState(() {
      _value2 = "Submit: $value";
    });
  }

  // functions to add and substract one from the value
  void _add() {
    setState(() {
      _value++;
    });
  }

  void _subtract() {
    setState(() {
      _value--;
    });
  }

  // function implementing the radio list
  Widget makeRadios() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 2; i++) {
      list.add(Radio(
        value: i,
        groupValue: _value5,
        onChanged: _setValue5,
      ));
    }
    Column column = Column(
      children: list,
    );
    return column;
  }

  // function implementing the radio list tiles
  Widget makeRadioTiles() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 2; i++) {
      list.add(RadioListTile(
        value: i,
        groupValue: _value6,
        onChanged: _setValue6,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text("Item: $i"),
        subtitle: const Text("Subtitle"),
      ));
    }
    Column column = Column(
      children: list,
    );
    return column;
  }

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
              /*
              Text(_value.toString()),
              //button to add one to the value
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _add,
              ),
              //button to subtract one from the value
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _subtract,
              ),
              //button to reset the value to 0
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _value = 0;
                  });
                },
              ),
              //button to change the text of the button
              Text(_value2),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Hello",
                  hintText: "Hint",
                  icon: Icon(Icons.people),
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChange,
                onSubmitted: _onSubmit,
              ),
              Checkbox(value: _value3, onChanged: _value3Changed),
              Switch(value: _value4, onChanged: _value4Changed),
              CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                title: const Text("Hello World"),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: const Text("Subtitle"),
                secondary: const Icon(Icons.archive),
                activeColor: Colors.red,
                checkColor: Colors.yellow,
                fillColor: MaterialStateProperty.all(Colors.black),
                hoverColor: Colors.blue,
                overlayColor: MaterialStateProperty.all(Colors.purple),
                selectedTileColor: Colors.orange,
              ),
              makeRadios(),
              makeRadioTiles(),
              //functions for the range slider interval goes from _value7 to _value8, min=0 max=100
              RangeSlider(
                values: RangeValues(_value7, _value8),
                onChanged: (RangeValues values) {
                  _setValue7(values.start);
                  _setValue8(values.end);
                },
                min: 0.0,
                max: 100.0,
                divisions: 100,
                labels: RangeLabels(
                  _value7.toString(),
                  _value8.toString(),
                ),
              ),
              */
              Text(_value9),
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
