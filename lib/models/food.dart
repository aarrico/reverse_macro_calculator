class Food {
  String _name;
  double _protein;
  double _carbs;
  double _fat;
  double _servingSize;

  Food(this._name, this._protein, this._carbs, this._fat, this._servingSize);

  Food.map(dynamic obj) {
    this._name = obj['name'];
    this._protein = obj['protein'];
    this._carbs = obj['carbs'];
    this._fat = obj['fat'];
    this._servingSize = obj['servingSize'];
  }

  String get name => _name;

  double get protein => _protein;

  double get carbs => _carbs;

  double get fat => _fat;

  double get servingSize => _servingSize;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["protein"] = _protein;
    map["carbs"] = _carbs;
    map["fat"] = _fat;
    map["servingSize"] = _servingSize;
    return map;
  }
}
