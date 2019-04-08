import 'package:bloc/bloc.dart';
import 'package:flutter_state_management/_bloc_lib/_events/selection.events.dart';
import 'package:flutter_state_management/_bloc_lib/_states/selection.state.dart';

class ItemSelectionBloc extends Bloc<ItemSelectionEvent, ItemSelectionState> {
  @override
  ItemSelectionState get initialState => ItemSelectionState([]);

  @override
  Stream<ItemSelectionState> mapEventToState(ItemSelectionEvent event) async* {
    if (event is SelectItemEvent) {
      final List<String> checkedItemIds = List.from(currentState.ids)..add(event.itemId);

      yield ItemSelectionState(checkedItemIds);
    } else if (event is DeselectItemEvent) {
      final List<String> checkedItemIds = List.from(currentState.ids)..remove(event.itemId);

      yield ItemSelectionState(checkedItemIds);
    } else if (event is ClearItemSelectionEvent) {
      final List<String> checkedItemIds = List.from(currentState.ids)..clear();

      yield ItemSelectionState(checkedItemIds);
    }
  }
}
