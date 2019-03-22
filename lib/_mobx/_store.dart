import 'package:flutter_state_management/item.model.dart';
import 'package:mobx/mobx.dart';

part '_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore implements Store {
  @observable
  ObservableList<Item> items = ObservableList<Item>.of(sampleItems);

  @observable
  ObservableSet<String> checkedItemIds = ObservableSet<String>();

  @action
  void addItem(Item item) {
    this.items.add(item);
  }

  @action
  void removeItem(Item item) {
    this.items.remove(item);
  }

  @action
  void addCheckedItem(String itemId) {
    this.checkedItemIds.add(itemId);
  }

  @action
  void removeCheckedItem(String itemId) {
    this.checkedItemIds.remove(itemId);
  }
}
