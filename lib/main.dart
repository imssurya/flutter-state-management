import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppState {
  final List<String> items;

  AppState({this.items});

  AppState.initialState()
      : items = ["Germany", "France", "England"]; //Dart Named Constructor
}

class AddAction {
  final String payload;

  AddAction({this.payload});
}

AppState reducer(AppState state, dynamic action) {
  if (action is AddAction) {
    return AppState(
        items: []
          ..addAll(state.items) // Dart Cascade
          ..add(action.payload));
  }

  return AppState(items: state.items);
}

typedef AddItem(String text);

class _ViewModel {
  final AddItem addItem;

  _ViewModel({this.addItem});
}

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {
  final store = Store<AppState>(reducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Redux Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ReduxPage(title: 'Flutter Redux Demo'),
        ));
  }
}

class ReduxPage extends StatelessWidget {
  ReduxPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ReduxListView(),
        floatingActionButton: StoreConnector<AppState, _ViewModel>(
          converter: (Store store) => _ViewModel(addItem: (item) {
                store.dispatch(AddAction(payload: item));
              }),
          builder: (BuildContext context, _ViewModel viewModel) {
            return FloatingActionButton(
              onPressed: () {
                viewModel.addItem("New Item");
              },
              tooltip: 'Add',
              child: Icon(Icons.add),
            );
          },
        ));
  }
}

class ReduxListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<String>>(
      converter: (Store<AppState> store) => store.state.items,
      builder: (context, items) {
        return ListView.builder(
            padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            });
      },
    );
  }
}
