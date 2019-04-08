import 'package:flutter_state_management/_bloc_lib/_lib/entitity.dart';
import 'package:flutter_state_management/_bloc_lib/_events/item.events.dart';
import 'package:flutter_state_management/_bloc_lib/_states/item.state.dart';
import 'package:flutter_state_management/item.model.dart';

class ItemEntityBloc extends EntityBloc<EntityEvent, ItemEntityState> {
  @override
  ItemEntityState get initialState => ItemEntityState(sampleItems);

  @override
  Stream<ItemEntityState> mapEventToState(EntityEvent event) async* {
    if (event is AddItemEvent) {
      final List<Item> items = List.from(currentState.entities)
        ..add(event.item);

      yield ItemEntityState(items);
    } else if (event is AddItemsEvent) {
      final List<Item> items = List.from(currentState.entities)
        ..addAll(event.items);

      yield ItemEntityState(items);
    } else if (event is RemoveItemsEvent) {
      final List<Item> items = List.from(currentState.entities);

      items.removeWhere((item) => event.itemIds.contains(item.id));

      yield ItemEntityState(items);
    }
  }
}
