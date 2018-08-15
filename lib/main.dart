import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_management/redux/actions.dart';
import 'package:flutter_state_management/redux/reducers.dart';
import 'package:flutter_state_management/redux/state.model.dart';
import 'package:redux/redux.dart';

typedef AddItemFn(String item);

class _ViewModel {
  final AddItemFn addItem;

  _ViewModel({this.addItem});
}

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {
  final store = Store<AppState>(appReducer, initialState: AppState.initialState());

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
          converter: (Store<AppState> store) {
            return _ViewModel(addItem: (item) {
              store.dispatch(AddItemAction(payload: item));
            });
          },
          builder: (BuildContext context, _ViewModel viewModel) {
            return FloatingActionButton(
              onPressed: () {
                viewModel.addItem('New Item');
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
      builder: (BuildContext context, List<String> items) {
        return ListView.builder(
            padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(items[index]),
              );
            });
      },
    );
  }
}
