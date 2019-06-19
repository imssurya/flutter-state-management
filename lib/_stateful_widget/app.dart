import 'package:flutter/material.dart';
import 'package:flutter_state_management/item.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(title: 'Stateful Widget Sample'),
    );
  }
}

class Page extends StatefulWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  List<Item> items = sampleItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListViewWidget(items: items),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => items.add(Item(title: DateTime.now().toString())));
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  ListViewWidget({Key key, this.items: const []}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
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