import 'package:flutter_state_management/_redux/_actions.dart';
import 'package:flutter_state_management/_redux/_state.dart';

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
