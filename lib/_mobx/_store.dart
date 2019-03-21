import 'package:mobx/mobx.dart';

part '_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore implements Store {
  @observable
  ObservableList<String> items = ObservableList<String>.of(['Item 1', 'Item 2', 'Item 3']);

  @observable
  ObservableSet<int> checkedItems = ObservableSet<int>();

  @action
  void addItem(String item) {
    this.items.add(item);
  }

  @action
  void removeItem(String item) {
    this.items.remove(item);
  }

  @action
  void addCheckedItem(int itemId) {
    this.checkedItems.add(itemId);
  }

  @action
  void removeCheckedItem(int itemId) {
    this.checkedItems.remove(itemId);
  }
}
