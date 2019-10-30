import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_state_management/_mobx/_store.dart';
import 'package:flutter_state_management/item.dart';

final store = AppStore();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(title: 'MobX Sample'),
    );
  }
}

class Page extends StatelessWidget {
  Page({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.addItem(Item(title: DateTime.now().toString()));
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: store.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(store.items[index].title),
            );
          },
        );
      },
    );
  }
}
