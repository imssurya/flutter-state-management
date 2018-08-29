import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/_bloc/_bloc.dart';

class ItemsBlocProvider extends InheritedWidget {
  final ItemsBloc itemsBloc;

  ItemsBlocProvider({
    Key key,
    ItemsBloc itemsBloc,
    Widget child,
  })  : itemsBloc = itemsBloc ?? ItemsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ItemsBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ItemsBlocProvider)
              as ItemsBlocProvider)
          .itemsBloc;
}
