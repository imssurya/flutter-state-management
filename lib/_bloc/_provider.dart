import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/_bloc/_bloc.dart';

class ItemsBlocProvider extends InheritedWidget {
  final ItemsBloc bloc;

  ItemsBlocProvider({
    Key key,
    Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ItemsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ItemsBlocProvider) as ItemsBlocProvider).bloc;
  }
}
