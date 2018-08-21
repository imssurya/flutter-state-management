import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  List<String> _items = ["Germany", "France", "Sweden", "Norway"];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);

    notifyListeners();
  }
}
