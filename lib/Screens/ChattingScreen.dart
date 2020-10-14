// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:leancloud_official_plugin/leancloud_plugin.dart';
import 'package:leancloud_storage/leancloud.dart';

class ChattingScreen extends StatelessWidget {
  final LCUser currentUser;
  ChattingScreen({Key key, @required this.currentUser}) : super(key: key);


  Future<void> loginToIM(String userToTalk) async {
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    Client user = Client(id: currentUser.email);
    await user.open();
    try{
      Conversation conversation = await user.createConversation(isUnique: true , members: {userToTalk},name: userToTalk + "&" + currentUser.username );

    }catch(e){print("Failed to create conversation");}
  }

  /// To create a normal [Conversation].
  ///
  /// [isUnique] is a special parameter, default is `true`, it affects the creation behavior and property [Conversation.isUnique].
  ///   * When it is `true` and the relevant unique [Conversation] not exists in the server, this method will create a new unique [Conversation].
  ///   * When it is `true` and the relevant unique [Conversation] exists in the server, this method will return that existing unique [Conversation].
  ///   * When it is `false`, this method always create a new non-unique [Conversation].
  ///
  /// [members] is the [Conversation.members].
  /// [name] is the [Conversation.name].
  /// [attributes] is the [Conversation.attributes].
  ///
  /// Returns an instance of [Conversation].
  // ignore: missing_return
  Future<Conversation> createConversation({
    bool isUnique = true,
    Set<String> members,
    String name,
    Map<String, dynamic> attributes,
  }) async {}

  /// To create a new [ChatRoom].
  ///
  /// [name] is the [Conversation.name].
  /// [attributes] is the [Conversation.attributes].
  ///
  /// Returns an instance of [ChatRoom].
  Future<ChatRoom> createChatRoom({
    String name,
    Map<String, dynamic> attributes,
  }) async {}

  /// To create a new [TemporaryConversation].
  ///
  /// [members] is the [Conversation.members].
  /// [timeToLive] is the [TemporaryConversation.timeToLive].
  ///
  /// Returns an instance of [TemporaryConversation].
  Future<TemporaryConversation> createTemporaryConversation({
    Set<String> members,
    int timeToLive,
  }) async {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
