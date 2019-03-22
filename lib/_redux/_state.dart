import 'package:flutter_state_management/item.model.dart';

class AppState {
  final List<Item> items;

  AppState({this.items});

  AppState.initialState() : items = sampleItems; //Dart Named Constructor
}
