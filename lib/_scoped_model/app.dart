import 'package:flutter/material.dart';
import 'package:flutter_state_management/_scoped_model/_model.dart';
import 'package:flutter_state_management/item.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  final AppModel appModel = AppModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
        model: appModel,
        child: MaterialApp(
          title: 'Scoped Model Sample',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Page(title: 'Scoped Model Sample'),
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
        floatingActionButton: ScopedModelDescendant<AppModel>(
            builder: (BuildContext context, Widget child, AppModel model) {
          return FloatingActionButton(
            onPressed: () =>
                model.addItem(Item(title: DateTime.now().toString())),
            tooltip: 'Add',
            child: Icon(Icons.add),
          );
        }));
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
      return ListView.builder(
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: model.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(model.items[index].title),
            );
          });
    });
  }
}
