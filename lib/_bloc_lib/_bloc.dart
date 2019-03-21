import 'package:bloc/bloc.dart';
import 'package:flutter_state_management/_bloc/_events.dart';

class ItemsBloc extends Bloc<ItemEvent, List<String>> {
  @override
  List<String> get initialState => ['Item 1', 'Item 2', 'Item 3'];

  @override
  Stream<List<String>> mapEventToState(List<String> currentState, ItemEvent event) async* {
    if (event is AddItemEvent) {
      yield List.from(currentState)..add(event.item);
    } else if (event is AddItemsEvent) {
      yield List.from(currentState)..addAll(event.items);
    }
  }
}
