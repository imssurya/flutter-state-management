import 'package:uuid/uuid.dart';

class Item {
  final String id;
  String title;

  Item({String id, this.title}) : id = id != null ? id : Uuid().v1();
}

final List<Item> sampleItems = [
  Item(title: 'Item 1'),
  Item(title: 'Item 2'),
  Item(title: 'Item 3')
];
