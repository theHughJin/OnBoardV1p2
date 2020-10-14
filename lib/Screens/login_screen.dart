// ignore: slash_for_doc_comments
/**
 * File representing the Login Screen. Users can use this screen to login, sign,
 * reset password in this screen
 * DataBase: LeanCloud where AppID is fpEzAenpIWtvEqMgD3IBpJRe
 * Temporal server is   https://fpezaenp.lc-cn-n1-shared.com
 * DECO3801 2020 TEAM MA Code
 * Last updated by Xin Jin 01/10/2020
 **/

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:onboard/Screens/homescreen.dart';


// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  LCUser current_User;

  /// Function which used for user to login to the program
  /// @Parameter: LoginData: Data of username and password which entered by users
  /// @Return null if successfully Login to the program and return String"Invalid Password or username" otherwise.
  Future<String> _authUser(LoginData data) {
    //Initialise the database
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    return Future.delayed(loginTime).then((_) async {
      try {
        // 登录成功
        await LCUser.login(data.name, data.password);
        current_User = await LCUser.getCurrent();
        if (current_User!= null){
          return null;
        }else{
          return "Invalid Password or Username";
        }
      } on LCException catch (e) {
        return "Invalid Username or passsowrd";
      }
    });
  }

  /// Function used for register a account for users
  /// @Parameter loginData: Data entered by users
  /// return null if successfully Signed in
  Future<String> _regUser(LoginData loginData) {
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    return Future.delayed(loginTime).then((_) async {
      LCUser user = LCUser();
      // 等同于 user['username'] = 'Tom';
      user.username = loginData.name;
      user.password = loginData.password;
      user.email = loginData.name;
      await user.signUp();
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'OnBoard',
      onLogin: _authUser,
      onSignup: _regUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(currentUser: current_User,)));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
