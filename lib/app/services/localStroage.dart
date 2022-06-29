import 'package:shared_preferences/shared_preferences.dart';

import 'package:meta/meta.dart';

import 'dart:async';

enum LSTypeSet { setBool, setInt, setString, setDouble }

enum LSTypeGet { getBool, getInt, getString, getDouble }

class AppPreferences {
  Future<AppPreferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  SharedPreferences? _preferences;

  Future<void> localStorageSet(
          {@required String? prefName,
          @required dynamic prefValue,
          prefType: LSTypeSet.setString}) async =>
      await _setPreference(
          prefName: prefName, prefValue: prefValue, prefType: prefType);

  dynamic localStorageGet(
          {@required String? prefName,
          LSTypeGet prefType = LSTypeGet.getString}) =>
      _getPreference(prefName: prefName, prefType: prefType);

  Future<void> localStorageDel({
    @required String? prefName,
  }) =>
      _delPreference(
        prefName: prefName,
      );

  Future<void>? localStorageDelMulti({
    @required List<String>? prefName,
  }) {
    for (var item in prefName!) {
      _delPreference(prefName: item);
    }
  }

  Future<void> _setPreference(
      {@required String? prefName,
      @required dynamic prefValue,
      LSTypeSet prefType = LSTypeSet.setString}) async {
    switch (prefType) {
      // prefType is bool
      case LSTypeSet.setBool:
        {
          await _preferences?.setBool(prefName ?? "", prefValue);
          break;
        }
      // prefType is int
      case LSTypeSet.setInt:
        {
          await _preferences?.setInt(prefName ?? "", prefValue);
          break;
        }
      // prefType is double
      case LSTypeSet.setDouble:
        {
          await _preferences?.setDouble(prefName ?? "", prefValue);
          break;
        }
      // prefType is String
      case LSTypeSet.setString:
        {
          await _preferences?.setString(prefName ?? "", prefValue);
          break;
        }
    }
  }

  dynamic _getPreference(
      {@required prefName, LSTypeGet prefType = LSTypeGet.getString}) {
    try {
      switch (prefType) {
        // prefType is bool
        case LSTypeGet.getBool:
          {
            return _preferences?.getBool(prefName) ?? false;
          }
        // prefType is int
        case LSTypeGet.getInt:
          {
            return _preferences?.getInt(prefName);
          }
        // prefType is double
        case LSTypeGet.getDouble:
          {
            return _preferences?.getDouble(prefName);
          }
        // prefType is String
        case LSTypeGet.getString:
          {
            return _preferences?.getString(prefName);
          }
      }
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> _delPreference({@required prefName}) async =>
      _preferences?.remove(prefName);
}
