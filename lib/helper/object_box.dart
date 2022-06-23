import 'package:flutter_object_box/objectbox.g.dart';

import '../model/user.dart';

class ObjectBox {
  late final Store _store;
  late final Box<User> _userBox;

  ObjectBox._init(this._store) {
    _userBox = Box<User>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }

  User? getUser(int id) => _userBox.get(id);
  int insertUser(User user) => _userBox.put(user);
  bool deleteUser(int id) => _userBox.remove(id);

  Stream<List<User>> getUsers() => _userBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());
}
