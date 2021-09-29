import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  CalculatorWidgetState createState() {
    return CalculatorWidgetState();
  }
}

class CalculatorWidgetState extends State<CalculatorWidget> {
  final _formKey = GlobalKey<FormState>();
  double _servingNeeded = 0.0;
  double _macroNeeded = 0.0;
  double _macroPerServing = 0.0;
  double _servingSize = 0.0;

  String? isValueValid(String? value) {
    return value == null || value.isEmpty || double.tryParse(value) == null ? 'Enter a number.' : null;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Amount of macro (protein, carbs, fat) needed:'
                ),
                validator: (value) {
                  return isValueValid(value);
                },
                onSaved: (val) =>
                {
                  if (val != null)
                    setState(() => _macroNeeded = double.parse(val))
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Macro amount per serving:'
                ),
                validator: (value) {
                  return isValueValid(value);
                },
                onSaved: (val) =>
                {
                  if (val != null)
                    setState(() => _macroPerServing = double.parse(val))
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Serving size:'
                ),
                validator: (value) {
                  return isValueValid(value);
                },
                onSaved: (val) =>
                {
                  if (val != null)
                    setState(() => _servingSize = double.parse(val))
                },
              ),
              Container(
                width: screenSize.width,
                child: ElevatedButton(
                  child: new Text('Submit',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                    }
                    setState(() {
                      _servingNeeded =
                          _macroNeeded * _servingSize / _macroPerServing;
                    });
                  },
                ),
              ),
              Text('Serving size needed: $_servingNeeded'),
            ]
        )
    );
  }
}