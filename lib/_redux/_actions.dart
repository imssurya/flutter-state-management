abstract class Action<T> {
  ActionType type;
  T payload;
}

enum ActionType { ADD_ITEM_ACTION }

class AddItemAction implements Action<String> {
  ActionType type = ActionType.ADD_ITEM_ACTION;
  String payload;

  AddItemAction({this.payload});
}
