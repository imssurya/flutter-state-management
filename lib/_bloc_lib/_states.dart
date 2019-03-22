import 'package:flutter_state_management/item.model.dart';

class ItemsState {
  final List<Item> items;

  ItemsState([this.items = const []]);
}

class CheckedItemsState {
  final Set<String> itemIds;

  CheckedItemsState([this.itemIds]);
}
