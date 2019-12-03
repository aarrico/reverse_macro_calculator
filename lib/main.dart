import 'package:flutter/material.dart';
import 'dart:io';
import 'utils.dart' as utils;

void main() {
  startMeUp() async {
    Directory docsDir =
        await getApplicationDocumentsDirectory();
    utils.docsDir = docsDir;
    runApp(ReverseMacroCalculator());
  }

  startMeUp();
}

class ReverseMacroCalculator extends StatelessWidget {
  Widget build(BuildContext inContext) {
    return MaterialApp(
      home : DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Reverse Macro Calculator'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.kitchen), text: 'Foods',),
                Tab(icon: Icon(Icons.computer), text: 'Calculator')
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[Calculator(), Food()],
          )
        ),
      )
    );
  }
}


class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  double _servingNeeded;
  double _macroNeeded;
  double _macroPerServing;
  double _servingSize;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount of macro needed:'
              ),
              validator: (value) {
                return double.parse(value) == null ? 'Enter a number.' : null;
              },
              onSaved: (val) => setState(() => _macroNeeded = double.parse(val)),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Macro amount per serving:'
              ),
              validator: (value) {
                return double.parse(value) == null ? 'Enter a number.' : null;
              },
              onSaved: (val) => setState(() => _macroPerServing = double.parse(val)),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Serving size:'
              ),
              validator: (value) {
                return double.parse(value) == null ? 'Enter a number.' : null;
              },
              onSaved: (val) => setState(() => _servingSize = double.parse(val)),
            ),
            Container(
              width: screenSize.width,
              child: RaisedButton(
                child: new Text('Submit',
                  style: new TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                  }
                  setState(() {
                    _servingNeeded = _macroNeeded * _servingSize/_macroPerServing;
                  });
                },
                color: Colors.blue,
              ),
            ),
            Text('$_servingNeeded'),
          ]
        )
    );
  }
}

//servingSizeTotal = macroTotal*(servingSize/servingMacro)
