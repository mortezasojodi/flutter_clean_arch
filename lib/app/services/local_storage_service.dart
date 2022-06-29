import 'package:fluttertest/app/services/localStroage.dart';

// enum _Key {
//   Token,
// }

class LocalStorageService {
  AppPreferences? instance;
  Future<LocalStorageService> init() async {
    instance = await AppPreferences().init();
    return this;
  }

  String? get token {
    final rawtoken = instance?.localStorageGet(prefName: "Token") as String?;
    if (rawtoken?.isEmpty ?? true) {
      return null;
    }
    return rawtoken;
  }

  set token(String? value) {
    if (value != null) {
      instance?.localStorageSet(
          prefValue: value, prefName: "Token", prefType: LSTypeSet.setString);
    } else {
      instance?.localStorageDel(prefName: "Token");
    }
  }

  // userModel? get user {
  //   final rawJson = _sharedPreferences?.getString(_Key.Token.toString());
  //   if (rawJson == null) {
  //     return null;
  //   }
  //   Map<String, dynamic> map = jsonDecode(rawJson);
  //   return userModel.fromMap(map);
  // }

  // set user(userModel? value) {
  //   if (value != null) {
  //     _sharedPreferences?.setString(
  //         _Key.Token.toString(), json.encode(value.toJson()));
  //   } else {
  //     _sharedPreferences?.remove(_Key.Token.toString());
  //   }
  // }
}
