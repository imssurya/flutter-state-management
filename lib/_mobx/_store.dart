import 'package:mobx/mobx.dart';

part '_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore implements Store {
  @observable
  ObservableList<String> items = ObservableList<String>.of(['Item 1', 'Item 2', 'Item 3']);

  @action
  void addItem(String item) {
    this.items.add(item);
  }
}
