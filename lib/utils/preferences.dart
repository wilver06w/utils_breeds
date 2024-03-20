library mobile_client_preferences;

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _singleton = Preferences._();

  factory Preferences() => _singleton;

  Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _traceIdKey = 'trace_id';
  String get traceId => _prefs?.getString(_traceIdKey) ?? '';
  set traceId(String value) => _prefs?.setString(_traceIdKey, value);

  final String _isRefreshingTokenKey = 'is_refreshing_token';
  bool get isRefreshingToken => _prefs?.getBool(_isRefreshingTokenKey) ?? false;
  set isRefreshingToken(bool value) =>
      _prefs?.setBool(_isRefreshingTokenKey, value);

  final String _countryKey = 'country';
  String get country => _prefs?.getString(_countryKey) ?? 'CO';
  set country(String value) => _prefs?.setString(_countryKey, value);

  final String _tokenKey = 'token';
  String get token => _prefs?.getString(_tokenKey) ?? '';
  set token(String value) => _prefs?.setString(_tokenKey, value);

  final String _isLoggedKey = 'is_logged';
  bool get isLogged => _prefs?.getBool(_isLoggedKey) ?? false;
  set isLogged(bool value) => _prefs?.setBool(_isLoggedKey, value);

  Future<void> reload() async {
    await _prefs?.reload();
  }

  Future<void> clear() async {
    await _prefs?.clear();
    token = '';
    country = '';
    isLogged = false;
  }
}
