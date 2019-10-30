import 'package:bloc/bloc.dart';

import 'items-selection.events.dart';
import 'items-selection.state.dart';

class ItemsSelectionBloc extends Bloc<ItemsSelectionEvent, ItemsSelectionState> {
  @override
  ItemsSelectionState get initialState => ItemsSelectionState([]);

  @override
  Stream<ItemsSelectionState> mapEventToState(ItemsSelectionEvent event) async* {
    if (event is SelectItemEvent) {
      final List<String> checkedItemIds = List.from(state.ids)..add(event.itemId);

      yield ItemsSelectionState(checkedItemIds);
    } else if (event is DeselectItemEvent) {
      final List<String> checkedItemIds = List.from(state.ids)..remove(event.itemId);

      yield ItemsSelectionState(checkedItemIds);
    } else if (event is ClearItemSelectionEvent) {
      final List<String> checkedItemIds = List.from(state.ids)..clear();

      yield ItemsSelectionState(checkedItemIds);
    }
  }
}
