import 'dart:async';

import 'package:flutter_state_management/_bloc/_events.dart';

//import 'package:rxdart/subjects.dart';

class ItemsBloc {
  final List<String> _items = [];
  final Set<int> _checkedItems = Set();

  final StreamController<ItemEvent> _itemsEventController = StreamController();

  StreamSink<ItemEvent> get itemsEventSink => _itemsEventController.sink;

  final StreamController<List<String>> _itemsStateController =
      StreamController();

  StreamSink<List<String>> get _itemsStateSink => _itemsStateController.sink;

  Stream<List<String>> get items => _itemsStateController.stream;

  List<StreamSubscription<dynamic>> _subscriptions;

  ItemsBloc({List<String> seedValue = const []}) {
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

  void _mapEventToState(ItemEvent event) {
    if (event is AddItemEvent) {
      _items.add(event.item);
      _itemsStateSink.add(_items);
    } else if (event is AddItemsEvent) {
      _items.addAll(event.items);
      _itemsStateSink.add(_items);
    }
  }
}
