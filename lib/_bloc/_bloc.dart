import 'dart:async';

import 'package:rxdart/subjects.dart';

class ItemsBloc {
  final List<String> _items = [];

  // Input sink
  StreamController<String> _addItemController;

  Sink<String> get addItem => _addItemController.sink;

  // Output stream
  StreamController<List<String>> _itemsStreamController;

  Stream<List<String>> get items => _itemsStreamController.stream;

  List<StreamSubscription<dynamic>> _subscriptions;

  ItemsBloc({List<String> seedValue = const []}) {
    _itemsStreamController = StreamController();
    _addItemController = StreamController();

    _subscriptions = <StreamSubscription<dynamic>>[_addItemController.stream.listen(_addItem)];

    _addItems(seedValue);
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

  void _addItems(List<String> items) {
    _items.addAll(items);

    _itemsStreamController.add(_items);
  }
}
