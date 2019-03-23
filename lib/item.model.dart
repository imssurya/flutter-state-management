import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class Item extends Equatable {
  final String id;
  final String title;

  Item({String id, this.title})
      : this.id = id ?? Uuid().v4(),
        super([id, title]);
}

final List<Item> sampleItems = [
  Item(title: 'Item 1'),
  Item(title: 'Item 2'),
  Item(title: 'Item 3')
];
