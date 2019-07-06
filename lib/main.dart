import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Reverse Macro Calculator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
