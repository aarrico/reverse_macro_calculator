import "../BaseModel.dart";

class Food {
  int id;
  String name;
  double protein;
  double carb;
  double fat;
  double calories;

  String toString() {
    return "{ id=$id, name=$name, protein=$protein, carb=$carb, fat=$fat, calories=$calories}";
  }
}

class FoodModel extends BaseModel {}

FoodModel foodModel = FoodModel();
