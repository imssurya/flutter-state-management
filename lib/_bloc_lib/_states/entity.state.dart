import 'package:equatable/equatable.dart';
import 'package:flutter_state_management/item.model.dart';
import 'package:meta/meta.dart';

@immutable
class ItemEntityState extends Equatable {
  final Map<String, Item> entities;
  final List<String> ids;
  final List<Item> items;

  ItemEntityState([this.items = const []])
      : entities = Map.fromIterable(items, key: (item) => item.id, value: (item) => item),
        ids = List.from(items.map((item) => item.id)),
        super([items]);
}
