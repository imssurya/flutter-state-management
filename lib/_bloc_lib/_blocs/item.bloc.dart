import 'package:flutter_state_management/_bloc_lib/_lib/entitity.dart';
import 'package:flutter_state_management/_bloc_lib/_events/item.events.dart';
import 'package:flutter_state_management/_bloc_lib/_lib/item.entity.dart';
import 'package:flutter_state_management/_bloc_lib/_states/item.state.dart';

class ItemEntityBloc extends EntityBloc<EntityEvent, ItemEntityState> {
  @override
  ItemEntityState get initialState => ItemEntityState(sampleItems);

  @override
  Stream<ItemEntityState> mapEventToState(EntityEvent event) async* {
    if (event is AddItemEvent) {
      final List<Item> items = List.from(state.entities)..add(event.item);

      yield ItemEntityState(items);
    } else if (event is AddItemsEvent) {
      final List<Item> items = List.from(state.entities)..addAll(event.items);

      yield ItemEntityState(items);
    } else if (event is RemoveItemsEvent) {
      final List<Item> items = List.from(state.entities);

      items.removeWhere((item) => event.itemIds.contains(item.id));

      yield ItemEntityState(items);
    }
  }
}
