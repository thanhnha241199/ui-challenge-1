import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:bookkeepa/config/app_constrants.dart';
import 'package:bookkeepa/config/env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CongnitoService {
  final userPool = new CognitoUserPool(
    AppConfig().userPoolId,
    AppConfig().clientId,
  );

  final storage = new FlutterSecureStorage();

  /// HANDLE TOKEN
  Future<Null> refreshToken() async {
    dynamic userInfo = await CongnitoService().getUserPass();
    final cognitoUser = new CognitoUser(userInfo['user'], userPool);
    final authDetails = new AuthenticationDetails(
        username: userInfo['user'], password: userInfo['pwd']);

    CognitoUserSession session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
      dynamic token = {
        'token': session.getIdToken().getJwtToken(),
      };

      await persistToken(userInfo['user'], userInfo['pwd'], token['token']);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<dynamic> getUserPass() async {
    return {
      'user': await storage.read(key: AppConstrants.USER),
      'pwd': await storage.read(key: AppConstrants.PWD),
    };
  }

  Future<dynamic> getToken() async {
    return {
      'token': await storage.read(key: AppConstrants.TOKEN),
    };
  }

  Future<bool> hasExpireToken() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if (await storage.read(key: AppConstrants.EXPIRE) != null) {
      final expireTime =
          int.parse(await storage.read(key: AppConstrants.EXPIRE));
      if ((expireTime - currentTime) < 60000) {
        return true;
      }
    }
    return false;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    String token = await storage.read(key: AppConstrants.TOKEN);
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String user, String pass, String token) async {
    await storage.write(key: AppConstrants.USER, value: user);
    await storage.write(key: AppConstrants.PWD, value: pass);
    await storage.write(key: AppConstrants.TOKEN, value: token);
    final expireTimeInTimestamp =
        DateTime.now().millisecondsSinceEpoch + (1 * 60 * 60 * 1000);
    await storage.write(
        key: AppConstrants.EXPIRE, value: expireTimeInTimestamp.toString());

    return;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await storage.delete(key: AppConstrants.TOKEN);
    await storage.delete(key: AppConstrants.USER);
    await storage.delete(key: AppConstrants.PWD);
    await storage.delete(key: AppConstrants.EXPIRE);
    return;
  }

  /// API
  Future<dynamic> loginCognito({String userName, String password}) async {
    final cognitoUser = new CognitoUser(userName, userPool);
    final authDetails =
        new AuthenticationDetails(username: userName, password: password);
    CognitoUserSession session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
    } catch (e) {
      print(e);
      throw e;
    }

    return {
      'token': session.getIdToken().getJwtToken(),
    };
  }

  Future<bool> signUpCognito(
      {String userName, String password, String phoneNumber}) async {
    var data;
    final userAttributes = [
      new AttributeArg(name: 'phone_number', value: phoneNumber),
    ];
    try {
      data = await userPool.signUp(
        userName,
        password,
        userAttributes: userAttributes,
      );
    } catch (e) {
      print(e);
      throw e;
    }
    return data != null;
  }

  Future<bool> verifyCodeCognito({String userName, String code}) async {
    final cognitoUser = new CognitoUser(userName, userPool);
    bool attributeVerified = false;
    try {
      attributeVerified = await cognitoUser.confirmRegistration(code);
    } catch (e) {
      print(e);
      throw e;
    }
    return attributeVerified;
  }
}
