import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'FoodDBWorker.dart';
import 'FoodEntry.dart';
import 'FoodList.dart';
import 'FoodModel.dart' show FoodModel, foodmodel;

class Food extends StatelessWidget {
  Food() {
    foodModel.loadData('food', FoodDBWorker.db);
  }

  Widget build(BuildContect inContext) {
    return ScopedModel<FoodModel>(
        model: foodModel,
        child: ScopedModelDescendent<FoodModel>(builder:
            (BuildContext inContext, Widget inChild, FoodModel inModel) {
          return IndexedStack(
              index: inModel.stackIndex, children: [FoodList(), FoodEntry()]);
        }));
  }
}
