import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ItemsSelectionState extends Equatable {
  final List<String> ids;

  ItemsSelectionState([this.ids]);

  @override
  List<Object> get props => [ids];
}
