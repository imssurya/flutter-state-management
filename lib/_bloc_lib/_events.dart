import 'package:flutter_state_management/item.model.dart';

abstract class ItemsEvent {}

class AddItemEvent extends ItemsEvent {
  final Item item;

  AddItemEvent(this.item);
}

class AddItemsEvent extends ItemsEvent {
  final List<Item> items;

  AddItemsEvent(this.items);
}

class RemoveItemsEvent extends ItemsEvent {
  final Set<String> itemIds;

  RemoveItemsEvent(this.itemIds);
}

class CheckItemEvent extends ItemsEvent {
  final String itemId;

  CheckItemEvent(this.itemId);
}

class UncheckItemEvent extends ItemsEvent {
  final String itemId;

  UncheckItemEvent(this.itemId);
}

class ClearCheckedItemsEvent extends ItemsEvent {
  ClearCheckedItemsEvent();
}
