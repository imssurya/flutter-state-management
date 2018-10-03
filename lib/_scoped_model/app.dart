import 'package:flutter/material.dart';
import 'package:flutter_state_management/_scoped_model/_model.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  AppModel appModel;

  @override
  void initState() {
    super.initState();
    appModel = AppModel();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
        model: appModel,
        child: MaterialApp(
          title: 'Flutter Scoped Model Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Page(title: 'Flutter Scoped Model Demo'),
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
            onPressed: () => model.addItem(DateTime.now().toString()),
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
              title: Text(model.items[index]),
            );
          });
    });
  }
}
