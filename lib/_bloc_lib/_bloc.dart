import 'package:bloc/bloc.dart';
import 'package:flutter_state_management/_bloc/_events.dart';
import 'package:flutter_state_management/item.model.dart';

class ItemsBloc extends Bloc<ItemEvent, List<Item>> {
  @override
  List<Item> get initialState =>
      [Item(title: 'Item 1'), Item(title: 'Item 2'), Item(title: 'Item 3')];

  @override
  Stream<List<Item>> mapEventToState(
      List<Item> currentState, ItemEvent event) async* {
    if (event is AddItemEvent) {
      yield List.from(currentState)..add(event.item);
    } else if (event is AddItemsEvent) {
      yield List.from(currentState)..addAll(event.items);
    } else if (event is RemoveItemsEvent) {
      List<Item> _items = List.from(currentState);
      _items.removeWhere((item) => event.itemIds.contains(item.id));

      yield _items;
    }
  }
}

class CheckedItemsBloc extends Bloc<ItemEvent, Set<String>> {
  @override
  Set<String> get initialState => Set();

  @override
  Stream<Set<String>> mapEventToState(
      Set<String> currentState, ItemEvent event) async* {
    if (event is CheckItemEvent) {
      yield Set.from(currentState)..add(event.itemId);
    } else if (event is UncheckItemEvent) {
      yield Set.from(currentState)..remove(event.itemId);
    } else if (event is ClearCheckedItemsEvent) {
      yield Set.from(currentState)..clear();
    }
  }
}
