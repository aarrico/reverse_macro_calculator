class Food {
  final String name;
  final double protein;
  final double carbs;
  final double fat;
  final double servingSize;

  Food({
    required this.name,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.servingSize
  });

  // Food.map(dynamic obj) {
  //   this._name = obj['name'];
  //   this._protein = obj['protein'];
  //   this._carbs = obj['carbs'];
  //   this._fat = obj['fat'];
  //   this._servingSize = obj['servingSize'];
  // }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["protein"] = protein;
    map["carbs"] = carbs;
    map["fat"] = fat;
    map["servingSize"] = servingSize;
    return map;
  }

  Food.loading() : this(name: '...', protein: 0, carbs: 0, fat: 0, servingSize: 0);

  bool get isLoading => name == '...';
}
