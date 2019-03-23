import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ItemSelectionState extends Equatable {
  final List<String> ids;

  ItemSelectionState([this.ids]) : super([ids]);
}
