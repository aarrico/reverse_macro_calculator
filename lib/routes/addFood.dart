import 'package:flutter/material.dart';

class AddFood extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Food')),
      body: AddFoodForm(),
    );
  }
}

class AddFoodForm extends StatefulWidget {
  @override
  AddFoodFormState createState() {
    return AddFoodFormState();
  }
}

class AddFoodFormState extends State<AddFoodForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
