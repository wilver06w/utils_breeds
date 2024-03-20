library mobile_client_config;

import 'package:flutter/material.dart';
import 'package:l10n_breeds/generated/l10n.dart';
import 'package:models_breeds/app/models/countries.dart';
import 'package:models_breeds/app/models/country/country.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:utils_breeds/utils/config/bloc/bloc.dart';
import 'package:utils_breeds/utils/config/environment.dart';

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
  late final AppConfigBloc blocProvider;
  String ip = '';
  late Country _country;
  Module? module;
  final navigatorKey = GlobalKey<NavigatorState>();
  String version = '0';

  final Map<String, dynamic> config;
  final Environment environment;

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
  }
}
