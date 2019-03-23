import 'package:equatable/equatable.dart';
import 'package:flutter_state_management/item.model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ItemEntityEvent extends Equatable {
  ItemEntityEvent([List props = const []]) : super(props);
}

class AddItemEvent extends ItemEntityEvent {
  final Item item;

  AddItemEvent(this.item) : super([item]);
}

class AddItemsEvent extends ItemEntityEvent {
  final List<Item> items;

  AddItemsEvent(this.items) : super([items]);
}

class RemoveItemsEvent extends ItemEntityEvent {
  final List<String> itemIds;

  RemoveItemsEvent(this.itemIds) : super([itemIds]);
}