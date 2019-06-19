import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/item.dart';

class _AppStateWidget extends InheritedModel<String> {
  _AppStateWidget({
    Key key,
    @required Widget child,
    @required this.state,
  }) : super(key: key, child: child);

  final AppState state;

  @override
  bool updateShouldNotify(_AppStateWidget oldWidget) => true;

  @override
  bool updateShouldNotifyDependent(InheritedModel<String> oldWidget, Set<String> dependencies) {
    if (dependencies.contains('items')) {
      return true;
    }

    return false;
  }
}

class AppStateContainer extends StatefulWidget {
  AppStateContainer({Key key, @required this.child, this.initialState}) : super(key: key);

  final Widget child;
  final AppStateModel initialState;

  @override
  State<AppStateContainer> createState() => AppState(initialState: initialState);

  static AppState of(BuildContext context, {Object aspect}) {
    return (InheritedModel.inheritFrom<_AppStateWidget>(context, aspect: aspect)).state;
  }
}

class AppStateModel {
  AppStateModel({this.items = const []});

  List<Item> items;
}

class AppState extends State<AppStateContainer> implements AppStateModel {
  AppState({AppStateModel initialState}) : items = initialState.items;

  List<Item> items;

  @override
  Widget build(BuildContext context) {
    return _AppStateWidget(state: this, child: widget.child);
  }

  void addItem(Item item) {
    setState(() {
      items.add(item);
    });
  }
}
