// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AppStore on _AppStore, Store {
  final _$itemsAtom = Atom(name: '_AppStore.items');

  @override
  ObservableList<Item> get items {
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.context.checkIfStateModificationsAreAllowed(_$itemsAtom);
    super.items = value;
    _$itemsAtom.reportChanged();
  }

  final _$checkedItemIdsAtom = Atom(name: '_AppStore.checkedItemIds');

  @override
  ObservableSet<String> get checkedItemIds {
    _$checkedItemIdsAtom.reportObserved();
    return super.checkedItemIds;
  }

  @override
  set checkedItemIds(ObservableSet<String> value) {
    _$checkedItemIdsAtom.context
        .checkIfStateModificationsAreAllowed(_$checkedItemIdsAtom);
    super.checkedItemIds = value;
    _$checkedItemIdsAtom.reportChanged();
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void addItem(Item item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addItem(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
