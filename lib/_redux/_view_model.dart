typedef AddItemFn(String item);

class AppViewModel {
  final AddItemFn addItem;

  AppViewModel({this.addItem});
}
