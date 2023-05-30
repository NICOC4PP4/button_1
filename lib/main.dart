import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  int _value = 0;
  String click = 'Click me';

  // function to add one to the value
  void _add() {
    setState(() {
      _value++;
    });
  }

  // function to subtract one from the value
  void _subtract() {
    setState(() {
      _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value.toString()),
              //button to add one to the value
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _add,
              ),
              //button to subtract one from the value
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: _subtract,
              ),
              //button to reset the value to 0
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _value = 0;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
