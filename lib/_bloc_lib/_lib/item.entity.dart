import 'package:flutter_state_management/_bloc_lib/_lib/entitity.dart';
import 'package:meta/meta.dart';

@immutable
class Item extends Entity {
  final String title;

  Item({String id, this.title}) : super(id, [title]);
}

final List<Item> sampleItems = [
  Item(title: 'Item 1'),
  Item(title: 'Item 2'),
  Item(title: 'Item 3')
];
