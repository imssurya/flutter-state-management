import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/item.dart';

class _AppStateWidget extends InheritedWidget {
  _AppStateWidget({
    Key key,
    @required Widget child,
    @required this.state,
  }) : super(key: key, child: child);

  final AppState state;

  @override
  bool updateShouldNotify(_AppStateWidget oldWidget) {
    return state != oldWidget.state;
  }
}

class AppStateModel {
  AppStateModel({
    this.items = const [],
  });

  List<Item> items;
}

class AppStateProvider extends StatefulWidget {
  AppStateProvider({
    Key key,
    @required this.child,
    this.initialState,
  }) : super(key: key);

  final Widget child;
  final AppStateModel initialState;

  @override
  State<AppStateProvider> createState() => AppState(initialState: initialState);

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AppStateWidget>().state;
  }
}

class AppState extends State<AppStateProvider> implements AppStateModel {
  AppState({
    AppStateModel initialState,
  }) : items = initialState.items;

  List<Item> items;

  @override
  Widget build(BuildContext context) {
    return _AppStateWidget(
      state: this,
      child: widget.child,
    );
  }

  void addItem(Item item) {
    setState(() => items.add(item));
  }
}
