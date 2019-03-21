abstract class ItemEvent {}

class AddItemEvent extends ItemEvent {
  final String payload;

  AddItemEvent(this.payload);
}

class AddItemsEvent extends ItemEvent {
  final List<String> payload;

  AddItemsEvent(this.payload);
}
