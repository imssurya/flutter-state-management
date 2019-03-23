import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ItemSelectionEvent extends Equatable {
  ItemSelectionEvent([List props = const []]) : super(props);
}

class SelectItemEvent extends ItemSelectionEvent {
  final String itemId;

  SelectItemEvent(this.itemId) : super([itemId]);
}

class DeselectItemEvent extends ItemSelectionEvent {
  final String itemId;

  DeselectItemEvent(this.itemId) : super([itemId]);
}

class ClearItemSelectionEvent extends ItemSelectionEvent {
  ClearItemSelectionEvent();
}