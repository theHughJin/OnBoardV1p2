import 'dart:collection';

import 'package:leancloud_storage/leancloud.dart';

class GloablMethods{

  Set<String> contactList;

  Future<void> generatingList(String name) async {
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    LCObject object = LCObject(name);
    object['Name'] = name;
    await object.save();
  }
  Future<void> addingFriend(LCUser currentUser, String friendName) async {
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    currentUser.add('ContactList', friendName);
        await currentUser.save();
  }
}