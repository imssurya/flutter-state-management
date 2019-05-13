import 'package:flutter/material.dart';
import 'package:flutter_state_management/item.model.dart';
import 'package:provider/provider.dart';

import '_state.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(title: 'Provider Sample'),
    );
  }
}

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => AppState(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: ListViewWidget(),
          floatingActionButton:
              Consumer<AppState>(builder: (context, state, _widget) {
            return FloatingActionButton(
              onPressed: () {
                state.addItem(Item(title: DateTime.now().toString()));
              },
              tooltip: 'Add',
              child: Icon(Icons.add),
            );
          })),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        itemCount: state.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(state.items[index].title),
          );
        });
  }
}
