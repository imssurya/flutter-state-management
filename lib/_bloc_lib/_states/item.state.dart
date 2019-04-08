import 'package:flutter_state_management/_bloc_lib/_lib/entitity.dart';
import 'package:flutter_state_management/item.model.dart';

class ItemEntityState extends EntityState<Item> {
  ItemEntityState([List<Item> items = const []]) : super(items);
}
