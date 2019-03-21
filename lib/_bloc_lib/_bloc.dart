import 'package:bloc/bloc.dart';
import 'package:flutter_state_management/_bloc/_events.dart';

class ItemsBloc extends Bloc<ItemEvent, List<String>> {
  @override
  List<String> get initialState => ['Item 1', 'Item 2', 'Item 3'];

  @override
  Stream<List<String>> mapEventToState(List<String> currentState, ItemEvent event) async* {
    if (event is AddItemEvent) {
      yield List.from(currentState)..add(event.item);
    } else if (event is AddItemsEvent) {
      yield List.from(currentState)..addAll(event.items);
    }
  }
}

class CheckedItemsBloc extends Bloc<ItemEvent, Set<int>> {
  @override
  Set<int> get initialState => Set();

  @override
  Stream<Set<int>> mapEventToState(Set<int> currentState, ItemEvent event) async* {
    if (event is CheckItemEvent) {
      yield Set.from(currentState)..add(event.itemId);
    } else if (event is UncheckItemEvent) {
      yield Set.from(currentState)..remove(event.itemId);
    }
  }
}
