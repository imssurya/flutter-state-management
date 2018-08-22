import 'dart:async';

import 'package:rxdart/subjects.dart';

class ItemsBloc {
  final List<String> _items = ['Germany', 'France', 'Sweden', 'Norway'];

  BehaviorSubject<List<String>> _itemsStreamController;
  StreamController<String> _addItemController;

  Stream<List<String>> get items => _itemsStreamController.stream; //@Output

  Sink<String> get addItem => _addItemController.sink; //@Input

  ItemsBloc() {
    _itemsStreamController = BehaviorSubject(seedValue: _items);
    _addItemController = StreamController<String>();
  }

  dispose() {
    _itemsStreamController.close();
    _addItemController.close();
  }
}
