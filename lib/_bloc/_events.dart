import 'package:flutter_state_management/item.model.dart';

abstract class ItemEvent {}

class AddItemEvent extends ItemEvent {
  final Item item;

  AddItemEvent(this.item);
}

class AddItemsEvent extends ItemEvent {
  final List<Item> items;

  AddItemsEvent(this.items);
}

class RemoveItemsEvent extends ItemEvent {
  final Set<String> itemIds;

  RemoveItemsEvent(this.itemIds);
}

class CheckItemEvent extends ItemEvent {
  final String itemId;

  CheckItemEvent(this.itemId);
}

class UncheckItemEvent extends ItemEvent {
  final String itemId;

  UncheckItemEvent(this.itemId);
}

class ClearCheckedItemsEvent extends ItemEvent {
  ClearCheckedItemsEvent();
}
