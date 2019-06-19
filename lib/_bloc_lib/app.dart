import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/item.bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/selection.bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_lib/entitity.dart';
import 'package:flutter_state_management/_bloc_lib/_events/item.events.dart';
import 'package:flutter_state_management/_bloc_lib/_states/item.state.dart';
import 'package:flutter_state_management/_bloc_lib/_events/selection.events.dart';
import 'package:flutter_state_management/_bloc_lib/_states/selection.state.dart';

import '_lib/item.entity.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ItemEntityBloc _itemEntityBloc = ItemEntityBloc();
  final ItemSelectionBloc _itemSelectionBloc = ItemSelectionBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<ItemEntityBloc>(bloc: _itemEntityBloc),
          BlocProvider<ItemSelectionBloc>(bloc: _itemSelectionBloc)
        ],
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
    _itemEntityBloc.dispose();
    _itemSelectionBloc.dispose();
    super.dispose();
  }
}

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ItemEntityBloc _itemEntityBloc = BlocProvider.of<ItemEntityBloc>(context);
    final ItemSelectionBloc _itemSelectionBloc = BlocProvider.of<ItemSelectionBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            BlocBuilder(
                bloc: _itemSelectionBloc,
                builder: (BuildContext context, ItemSelectionState selectionState) {
                  return Visibility(
                      visible: selectionState.ids.isNotEmpty,
                      child: IconButton(
                          icon: Icon(Icons.delete),
                          tooltip: 'Delete selected items',
                          onPressed: () {
                            _itemEntityBloc.dispatch(RemoveItemsEvent(selectionState.ids));
                            _itemSelectionBloc.dispatch(ClearItemSelectionEvent());
                          }));
                })
          ],
        ),
        body: ListViewWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _itemEntityBloc.dispatch(AddItemEvent(Item(title: DateTime.now().toString())));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemEntityBloc _itemEntityBloc = BlocProvider.of<ItemEntityBloc>(context);

    return BlocBuilder<EntityEvent, ItemEntityState>(
        bloc: _itemEntityBloc,
        builder: (BuildContext context, ItemEntityState entityState) {
          return ListView.builder(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              itemCount: entityState.entities.length,
              itemBuilder: (BuildContext context, int index) {
                final ItemSelectionBloc _itemSelectionBloc =
                    BlocProvider.of<ItemSelectionBloc>(context);

                return BlocBuilder(
                    bloc: _itemSelectionBloc,
                    builder: (BuildContext context, ItemSelectionState selectionState) {
                      final item = entityState.entities[index];

                      return CheckboxListTile(
                          title: Text(item.title),
                          value: selectionState.ids.contains(item.id),
                          onChanged: (bool newValue) {
                            final event =
                                newValue ? SelectItemEvent(item.id) : DeselectItemEvent(item.id);
                            _itemSelectionBloc.dispatch(event);
                          });
                    });
              });
        });
  }
}
