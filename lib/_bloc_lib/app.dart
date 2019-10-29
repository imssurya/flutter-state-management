import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/item.bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_blocs/selection.bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_events/item.events.dart';
import 'package:flutter_state_management/_bloc_lib/_states/item.state.dart';
import 'package:flutter_state_management/_bloc_lib/_events/selection.events.dart';
import 'package:flutter_state_management/_bloc_lib/_states/selection.state.dart';

import '_lib/item.entity.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          builder: (context) => ItemEntityBloc(),
        ),
        BlocProvider(
          builder: (context) => ItemSelectionBloc(),
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
    final _entityBloc = BlocProvider.of<ItemEntityBloc>(context);
    final _selectionBloc = BlocProvider.of<ItemSelectionBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          BlocBuilder<ItemSelectionBloc, ItemSelectionState>(
            bloc: _selectionBloc,
            builder: (context, state) {
              return Visibility(
                visible: state.ids.isNotEmpty,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  tooltip: 'Delete selected items',
                  onPressed: () {
                    _entityBloc.add(RemoveItemsEvent(state.ids));
                    _selectionBloc.add(ClearItemSelectionEvent());
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
          _entityBloc.add(AddItemEvent(Item(title: DateTime.now().toString())));
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
    final _entityBloc = BlocProvider.of<ItemEntityBloc>(context);

    return BlocBuilder<ItemEntityBloc, ItemEntityState>(
      bloc: _entityBloc,
      builder: (context, entityState) {
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: entityState.entities.length,
          itemBuilder: (context, index) {
            final _selectionBloc = BlocProvider.of<ItemSelectionBloc>(context);

            return BlocBuilder<ItemSelectionBloc, ItemSelectionState>(
              bloc: _selectionBloc,
              builder: (context, selectionState) {
                final item = entityState.entities[index];

                return CheckboxListTile(
                  title: Text(item.title),
                  value: selectionState.ids.contains(item.id),
                  onChanged: (isChecked) {
                    final event = isChecked
                        ? SelectItemEvent(item.id)
                        : DeselectItemEvent(item.id);
                    _selectionBloc.add(event);
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
