import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/items-selection/items-selection.bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/items-selection/items-selection.events.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/items-selection/items-selection.state.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/items/items.bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/items/items.events.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/items/items.state.dart';
import 'package:flutter_state_management/_bloc_lib/_shared/item.entity.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemsBloc>(
          builder: (context) => ItemsBloc(),
        ),
        BlocProvider<ItemsSelectionBloc>(
          builder: (context) => ItemsSelectionBloc(),
        )
      ],
      child: MaterialApp(
        title: 'BLoC Lib Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Page(
          title: 'BLoC Lib Sample',
        ),
      ),
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
  Widget build(context) {
    // ignore: close_sinks
    final _itemsBloc = BlocProvider.of<ItemsBloc>(context);
    // ignore: close_sinks
    final _itemsSelectionBloc = BlocProvider.of<ItemsSelectionBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          BlocBuilder<ItemsSelectionBloc, ItemsSelectionState>(
            bloc: _itemsSelectionBloc,
            builder: (context, state) {
              return Visibility(
                visible: state.ids.isNotEmpty,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  tooltip: 'Delete selected items',
                  onPressed: () {
                    _itemsBloc.add(RemoveItemsEvent(state.ids));
                    _itemsSelectionBloc.add(ClearItemSelectionEvent());
                  },
                ),
              );
            },
          )
        ],
      ),
      body: ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _itemsBloc.add(AddItemEvent(Item(title: DateTime.now().toString())));
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(context) {
    final _itemsBloc = BlocProvider.of<ItemsBloc>(context);

    return BlocBuilder<ItemsBloc, ItemsState>(
      bloc: _itemsBloc,
      builder: (context, entityState) {
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: entityState.entities.length,
          itemBuilder: (context, index) {
            final _itemsSelectionBloc =
                BlocProvider.of<ItemsSelectionBloc>(context);

            return BlocBuilder<ItemsSelectionBloc, ItemsSelectionState>(
              bloc: _itemsSelectionBloc,
              builder: (context, selectionState) {
                final item = entityState.entities[index];

                return CheckboxListTile(
                  title: Text(item.title),
                  value: selectionState.ids.contains(item.id),
                  onChanged: (isChecked) {
                    final event = isChecked
                        ? SelectItemEvent(item.id)
                        : DeselectItemEvent(item.id);
                    _itemsSelectionBloc.add(event);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
