import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_bloc.dart';
import 'package:flutter_state_management/_bloc/_events.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ItemsBloc _itemsBloc = ItemsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsBloc>(
        bloc: _itemsBloc,
        child: MaterialApp(
          title: 'BLoC Lib Sample',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Page(title: 'BLoC Lib Sample'),
        ));
  }

  @override
  void dispose() {
    _itemsBloc.dispose();
    super.dispose();
  }
}

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ItemsBloc _itemsBloc = BlocProvider.of<ItemsBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListViewWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _itemsBloc.dispatch(AddItemEvent(DateTime.now().toString()));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemsBloc _itemsBloc = BlocProvider.of<ItemsBloc>(context);

    return BlocBuilder<ItemEvent, List<String>>(
        bloc: _itemsBloc,
        builder: (BuildContext context, List<String> items) {
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
