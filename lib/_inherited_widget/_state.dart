import 'package:flutter/widgets.dart';

class _AppStateWidget extends InheritedWidget {
  _AppStateWidget({
    Key key,
    @required Widget child,
    @required this.state,
  }) : super(key: key, child: child);

  final AppState state;

  @override
  bool updateShouldNotify(_AppStateWidget oldWidget) => true;
}

class AppStateContainer extends StatefulWidget {
  AppStateContainer({Key key, @required this.child, this.initialState})
      : super(key: key);

  final Widget child;
  final AppStateModel initialState;

  @override
  State<AppStateContainer> createState() =>
      AppState(initialState: initialState);

  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppStateWidget)
            as _AppStateWidget)
        .state;
  }
}

class AppStateModel {
  AppStateModel({this.items = const []});

  List<String> items;
}

class AppState extends State<AppStateContainer> implements AppStateModel {
  AppState({AppStateModel initialState}) : items = initialState.items;

  List<String> items;

  @override
  Widget build(BuildContext context) {
    return _AppStateWidget(state: this, child: widget.child);
  }

  void addItem(String item) {
    setState(() {
      items.add(item);
    });
  }
}
