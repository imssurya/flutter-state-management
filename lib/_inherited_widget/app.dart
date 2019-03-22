import 'package:flutter/material.dart';
import 'package:flutter_state_management/_inherited_widget/_state.dart';
import 'package:flutter_state_management/item.model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppStateContainer(
      initialState: AppStateModel(items: sampleItems),
      child: MaterialApp(
          title: 'Inherited Widget Sample',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Page(title: 'Inherited Widget Sample')),
    );
  }
}

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final AppState state = AppStateContainer.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListViewWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              state.addItem(Item(title: DateTime.now().toString())),
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}

class ListViewWidget extends StatelessWidget {
  ListViewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppState state = AppStateContainer.of(context);
    final List<Item> items = state.items;

    return ListView.builder(
        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index].title),
          );
        });
  }
}
