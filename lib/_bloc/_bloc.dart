import 'dart:async';

import 'package:flutter_state_management/_bloc_lib/_events/entity.events.dart';
import 'package:flutter_state_management/item.model.dart';

//import 'package:rxdart/subjects.dart';

class ItemsBloc {
  final List<Item> _items = [];

  final StreamController<ItemEntityEvent> _itemsEventController = StreamController();

  StreamSink<ItemEntityEvent> get itemsEventSink => _itemsEventController.sink;

  final StreamController<List<Item>> _itemsStateController = StreamController();

  StreamSink<List<Item>> get _itemsStateSink => _itemsStateController.sink;

  Stream<List<Item>> get items => _itemsStateController.stream;

  List<StreamSubscription<dynamic>> _subscriptions;

  ItemsBloc({List<Item> seedValue = const []}) {
    _subscriptions = <StreamSubscription<dynamic>>[
      _itemsEventController.stream.listen(_mapEventToState)
    ];

    itemsEventSink.add(AddItemsEvent(seedValue));
  }

  dispose() {
    _itemsStateController.close();
    _itemsEventController.close();
    _subscriptions.forEach((subscription) => subscription.cancel());
  }

  void _mapEventToState(ItemEntityEvent event) {
    if (event is AddItemEvent) {
      _items.add(event.item);
      _itemsStateSink.add(_items);
    } else if (event is AddItemsEvent) {
      _items.addAll(event.items);
      _itemsStateSink.add(_items);
    }
  }
}
