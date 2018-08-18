import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_management/_redux/actions.dart';
import 'package:flutter_state_management/_redux/reducers.dart';
import 'package:flutter_state_management/_redux/state.model.dart';
import 'package:redux/redux.dart';

typedef AddItemFn(String item);

class _AppViewModel {
  final AddItemFn addItem;

  _AppViewModel({this.addItem});
}

class App extends StatelessWidget {
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
          home: Page(title: 'Flutter Redux Demo'),
        ));
  }
}

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListViewWidget(),
        floatingActionButton: StoreConnector<AppState, _AppViewModel>(
          converter: (Store<AppState> store) {
            return _AppViewModel(addItem: (item) {
              store.dispatch(AddItemAction(payload: item));
            });
          },
          builder: (BuildContext context, _AppViewModel viewModel) {
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

class ListViewWidget extends StatelessWidget {
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
