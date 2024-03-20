import 'package:flutter_modular/flutter_modular.dart';
import 'package:models_breeds/app/models/breed.dart';

class ProTiendasRoute {
  static Future<Object?> navHome() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/home/',
      (_) => false,
    );
  }

  static Future<Object?> navCart() async {
    return Modular.to.pushNamed('/cart/');
  }

  static Future<Object?> navLogin() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/auth/',
      (_) => false,
    );
  }

  static Future<Object?> navDetail({
    DetailParams? detailParams,
  }) async {
    return Modular.to.pushNamed(
      '/detail',
      arguments: {
        'params': detailParams,
      },
    );
  }
}

class DetailParams {
  final Breed? breed;
  final String id;
  final String name;
  final String image;

  DetailParams({
    this.breed,
    required this.id,
    required this.name,
    required this.image,
  });
}
