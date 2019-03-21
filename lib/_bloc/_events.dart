abstract class ItemEvent {}

class AddItemEvent extends ItemEvent {
  final String item;

  AddItemEvent(this.item);
}

class AddItemsEvent extends ItemEvent {
  final List<String> items;

  AddItemsEvent(this.items);
}
