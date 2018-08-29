import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);

    notifyListeners();
  }
}
