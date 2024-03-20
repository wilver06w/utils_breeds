library mobile_client_config;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:l10n_breeds/generated/l10n.dart';
import 'package:models_breeds/app/models/countries.dart';
import 'package:models_breeds/app/models/country/country.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:utils_breeds/utils/config/bloc/bloc.dart';
import 'package:utils_breeds/utils/config/environment.dart';
import 'package:utils_breeds/utils/config/main/bloc/bloc.dart';

class AppConfig {
  factory AppConfig({
    void Function(Country)? onUpdateCountry,
    Map<String, dynamic>? config,
    Environment? environment,
  }) {
    return _singleton ??
        AppConfig._(
          config: config ?? {},
          environment: environment ?? Environment.dev,
          uc: onUpdateCountry,
        );
  }

  AppConfig._({
    required this.config,
    required this.environment,
    void Function(Country)? uc,
  }) {
    onUpdateCountry = uc;
    blocProvider = AppConfigBloc(countries.first);

    _mxDefaultDocument = config['mx_default_document'] ?? '';
    _mxDefaultUuid = config['mx_default_uuid'] ?? '';
    _uxCamKey = config['ux_cam_key'] ?? '';

    _segmentKey = Platform.isIOS
        ? (config['segment_key_ios'] ?? '')
        : (config['segment_key_android'] ?? '');
    _sentryKey = config['sentry_key'] ?? '';

    _country = countries.firstWhere(
      (c) => c.code == 'CO',
      orElse: () => countries.first,
    );
    if (onUpdateCountry != null) uc!(_country);
    _configure();
  }

  static AppConfig? _singleton;

  final bool isProd = (const bool.fromEnvironment('dart.vm.product'));
  void Function(Country)? onUpdateCountry;
  String appType = 'b2b';
  late final AppConfigBloc blocProvider;

  String? cellphoneProvisional;
  late Country _country;
  bool hasActiveOrders = false;
  bool hasAddress = false;
  String ip = '';
  Module? module;
  final navigatorKey = GlobalKey<NavigatorState>();
  String version = '0';
  String warehouseUuid = '';
  String _mxDefaultDocument = '';
  String _mxDefaultUuid = '';
  String _uxCamKey = '';
  String _segmentKey = '';
  String _sentryKey = '';
  String marketingZone = '';

  final Map<String, dynamic> config;
  final Environment environment;

  String get mxDefaultDocument => _mxDefaultDocument;

  String get mxDefaultUuid => _mxDefaultUuid;

  String get uxCamKey => _uxCamKey;

  String get segmentKey => _segmentKey;

  String get sentryKey => _sentryKey;

  Country get country => _country;

  set country(Country country) {
    _country = country;
    blocProvider.add(
      ChangeCountryEvent(country),
    );
    _configure();
  }

  List<Country> get countries {
    return Countries(
      config: config,
    ).all;
  }

  void _configure() async {
    XigoHttpClient().getInstance(this);

    S.load(
      Locale(
        _country.locale!.languageCode!,
        _country.locale!.countryCode!,
      ),
    );

    if (onUpdateCountry != null) onUpdateCountry!(_country);
  }

  void clear() async {
    _configure();
    country = countries.first;
    warehouseUuid = '';
    ip = '';
    marketingZone = '';
  }

  Future<void> logout() async {
    clear();
    Modular.to.pushNamedAndRemoveUntil('/', (_) => false);

    Modular.get<Bloc>().add(ChangeKeyEvent());
  }

  Future<void> reOpenApp() async {
    Modular.to.pushNamedAndRemoveUntil('/', (_) => false);

    Modular.get<Bloc>().add(ChangeKeyEvent());
  }
}
