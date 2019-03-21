// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$AppStore on _AppStore, Store {
  final _$itemsAtom = Atom(name: '_AppStore.items');

  @override
  ObservableList<String> get items {
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(ObservableList<String> value) {
    mainContext.checkIfStateModificationsAreAllowed(_$itemsAtom);
    super.items = value;
    _$itemsAtom.reportChanged();
  }

  final _$checkedItemsAtom = Atom(name: '_AppStore.checkedItems');

  @override
  ObservableSet<int> get checkedItems {
    _$checkedItemsAtom.reportObserved();
    return super.checkedItems;
  }

  @override
  set checkedItems(ObservableSet<int> value) {
    mainContext.checkIfStateModificationsAreAllowed(_$checkedItemsAtom);
    super.checkedItems = value;
    _$checkedItemsAtom.reportChanged();
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void addItem(String item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addItem(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.removeItem(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCheckedItem(int itemId) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addCheckedItem(itemId);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCheckedItem(int itemId) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.removeCheckedItem(itemId);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
