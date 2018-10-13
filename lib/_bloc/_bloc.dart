import 'dart:async';

import 'package:rxdart/subjects.dart';

class ItemsBloc {
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  // Input sink
  StreamController<String> _addItemController;

  Sink<String> get addItem => _addItemController.sink;

  // Output stream
  BehaviorSubject<List<String>> _itemsStreamController;

  Stream<List<String>> get items => _itemsStreamController.stream;

  List<StreamSubscription<dynamic>> _subscriptions;

  ItemsBloc() {
    _itemsStreamController = BehaviorSubject(seedValue: _items);
    _addItemController = StreamController<String>();

    _subscriptions = <StreamSubscription<dynamic>>[_addItemController.stream.listen(_addItem)];
  }

  dispose() {
    _itemsStreamController.close();
    _addItemController.close();
    _subscriptions.forEach((subscription) => subscription.cancel());
  }

  void _addItem(String item) {
    _items.add(item);

    _itemsStreamController.add(_items);
  }
}
