import 'package:bloc/bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_events/entity.events.dart';
import 'package:flutter_state_management/_bloc_lib/_states/entity.state.dart';
import 'package:flutter_state_management/item.model.dart';

class ItemEntityBloc extends Bloc<ItemEntityEvent, ItemEntityState> {
  @override
  ItemEntityState get initialState => ItemEntityState(sampleItems);

  @override
  Stream<ItemEntityState> mapEventToState(
      ItemEntityState currentState, ItemEntityEvent event) async* {
    if (event is AddItemEvent) {
      final List<Item> items = List.from(currentState.items)..add(event.item);

      yield ItemEntityState(items);
    } else if (event is AddItemsEvent) {
      final List<Item> items = List.from(currentState.items)..addAll(event.items);

      yield ItemEntityState(items);
    } else if (event is RemoveItemsEvent) {
      final List<Item> items = List.from(currentState.items);

      items.removeWhere((item) => event.itemIds.contains(item.id));

      yield ItemEntityState(items);
    }
  }
}
