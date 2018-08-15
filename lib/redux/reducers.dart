import 'package:flutter_state_management/redux/actions.dart';
import 'package:flutter_state_management/redux/state.model.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(items: itemsReducer(state.items, action));
}

List<String> itemsReducer(List<String> state, dynamic action) {
  if (action is AddItemAction) {
    return []
      ..addAll(state) // Dart Cascade
      ..add(action.payload);
  }

  return state;
}
