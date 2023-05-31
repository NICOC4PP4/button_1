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

double _value1 = 20.0;
double _value2 = 80.0;
String _value3 = "";
int _value4 = 0;
int _index = 0;
String _value = "";

// set the enum string to 3 animals
enum Animals { cat, dog, bird }

class _State extends State<MyApp> {
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

  // functions to add and substract one from the value
  void _add() {
    setState(() {
      _value4++;
    });
  }

  void _subtract() {
    setState(() {
      _value4--;
    });
  }

  List<BottomNavigationBarItem> _items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: "School",
    ),
  ];

  // function implementing the choose list
  void setValue(String value) => setState(() => _value = value);

  Future _askUser() async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("What is your favorite animal?"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Animals.cat);
              },
              child: const Text("cat"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Animals.dog);
              },
              child: const Text("dog"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Animals.bird);
              },
              child: const Text("bird"),
            ),
          ],
        );
      },
    )) {
      case Animals.cat:
        setValue("cat");
        break;
      case Animals.dog:
        setValue("dog");
        break;
      case Animals.bird:
        setValue("bird");
        break;
    }
  }

  //___________________________________________________________

  @override
  void initState() {
    super.initState();
    _value3 = DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // make a drawer here
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Drawer Header",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // button that closes the drawer
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close Drawer")),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Item 3"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // make bottom navigation bar here
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _index,
        fixedColor: Colors.blue,
        onTap: (int item) {
          setState(() {
            _index = item;
            _value = "Current value is: ${_index.toString()}";
          });
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _value4 = 0;
          });
        },
        child: const Icon(Icons.exposure_zero),
      ),

      appBar: AppBar(
        title: const Text("Testing"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _add,
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _subtract,
          ),
        ],
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
                  _value1.round().toString(),
                  _value2.round().toString(),
                ),
              ),
              Text(_value3), // text to show the date
              ElevatedButton(
                onPressed: _selectDate,
                child: const Text("Select Date"),
              ),
              Text(_value4.toString()), //text to show the value of the counter
              // display the value of the bottom navigation bar
              Text(_value),
              // add lines here
              const Divider(
                height: 10.0,
                color: Colors.black,
              ),
              // make the button that calls the choose list
              ElevatedButton(
                onPressed: _askUser,
                child: const Text("Click Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
