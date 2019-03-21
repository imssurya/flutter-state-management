abstract class ItemEvent {}

class AddItemEvent extends ItemEvent {
  final String item;

  AddItemEvent(this.item);
}

class AddItemsEvent extends ItemEvent {
  final List<String> items;

  AddItemsEvent(this.items);
}

class CheckItemEvent extends ItemEvent {
  final int itemId;

  CheckItemEvent(this.itemId);
}

class UncheckItemEvent extends ItemEvent {
  final int itemId;

  UncheckItemEvent(this.itemId);
}
