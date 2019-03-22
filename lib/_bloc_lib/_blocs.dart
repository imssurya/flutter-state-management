import 'package:bloc/bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_events.dart';
import 'package:flutter_state_management/_bloc_lib/_states.dart';
import 'package:flutter_state_management/item.model.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  @override
  ItemsState get initialState => ItemsState(sampleItems);

  @override
  Stream<ItemsState> mapEventToState(ItemsState currentState, ItemsEvent event) async* {
    if (event is AddItemEvent) {
      final List<Item> items = List.from(currentState.items)..add(event.item);

      yield ItemsState(items);
    } else if (event is AddItemsEvent) {
      final List<Item> items = List.from(currentState.items)..addAll(event.items);

      yield ItemsState(items);
    } else if (event is RemoveItemsEvent) {
      final List<Item> items = List.from(currentState.items);
      items.removeWhere((item) => event.itemIds.contains(item.id));

      yield ItemsState(items);
    }
  }
}

class CheckedItemsBloc extends Bloc<ItemsEvent, CheckedItemsState> {
  @override
  CheckedItemsState get initialState => CheckedItemsState(Set());

  @override
  Stream<CheckedItemsState> mapEventToState(
      CheckedItemsState currentState, ItemsEvent event) async* {
    if (event is CheckItemEvent) {
      final Set<String> checkedItemIds = Set.from(currentState.itemIds)..add(event.itemId);

      yield CheckedItemsState(checkedItemIds);
    } else if (event is UncheckItemEvent) {
      final Set<String> checkedItemIds = Set.from(currentState.itemIds)..remove(event.itemId);

      yield CheckedItemsState(checkedItemIds);
    } else if (event is ClearCheckedItemsEvent) {
      final Set<String> checkedItemIds = Set.from(currentState.itemIds)..clear();

      yield CheckedItemsState(checkedItemIds);
    }
  }
}
