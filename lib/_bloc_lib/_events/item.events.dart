import 'package:flutter_state_management/_bloc_lib/_lib/entitity.dart';
import 'package:flutter_state_management/item.model.dart';

class AddItemEvent extends EntityEvent<Item> {
  final Item item;

  AddItemEvent(this.item) : super([item]);
}

class AddItemsEvent extends EntityEvent<Item> {
  final List<Item> items;

  AddItemsEvent(this.items) : super([items]);
}

class RemoveItemsEvent extends EntityEvent<Item> {
  final List<String> itemIds;

  RemoveItemsEvent(this.itemIds) : super([itemIds]);
}
