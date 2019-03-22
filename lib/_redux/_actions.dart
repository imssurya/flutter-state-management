import 'package:flutter_state_management/item.model.dart';

abstract class Action<T> {
  ActionType type;
  T payload;
}

enum ActionType { ADD_ITEM_ACTION }

class AddItemAction implements Action<Item> {
  ActionType type = ActionType.ADD_ITEM_ACTION;
  Item payload;

  AddItemAction({this.payload});
}
