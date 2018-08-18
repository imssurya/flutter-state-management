abstract class Action {
  ActionType type;
}

enum ActionType { ADD_ITEM_ACTION }

class AddItemAction implements Action {
  ActionType type = ActionType.ADD_ITEM_ACTION;

  final String payload;

  AddItemAction({this.payload});
}
