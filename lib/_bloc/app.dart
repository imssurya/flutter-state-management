import 'package:flutter/material.dart';
import 'package:flutter_state_management/_bloc/_bloc.dart';
import 'package:flutter_state_management/_bloc/_events.dart';
import 'package:flutter_state_management/_bloc/_provider.dart';

class App extends StatelessWidget {
  final ItemsBloc itemsBloc = ItemsBloc(
      seedValue: ['Item 1', 'Item 2', 'Item 3']); // there's no DI system in Flutter so far

  @override
  Widget build(BuildContext context) {
    return ItemsBlocProvider(
        bloc: itemsBloc,
        child: MaterialApp(
          title: 'Flutter BLoC Sample',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Page(title: 'Flutter BLoC Sample'),
        ));
  }
}

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ItemsBloc itemsBloc = ItemsBlocProvider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListViewWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            itemsBloc.itemsEventSink.add(AddItemEvent(DateTime.now().toString()));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemsBloc itemsBloc = ItemsBlocProvider.of(context);

    return StreamBuilder<List<String>>(
        stream: itemsBloc.items,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          final items = snapshot.data;

          return ListView.builder(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              itemCount: items is List<String> ? items.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                );
              });
        });
  }
}
