import 'package:uuid/uuid.dart';

class Item {
  final String id;
  String title;

  Item({String id, this.title}) : id = id != null ? id : Uuid().v1();
}
