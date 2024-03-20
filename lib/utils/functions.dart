import 'package:models_breeds/app/models/breed.dart';
import 'package:share_me/share_me.dart';

class Functions {
  static Future<void> sharedBreedInfo({required String url}) async {
    ShareMe.system(
      title: 'Conoce sobre esta Raza de Gato',
      description:
          '¡Hola Broo! Quiero compartir contigo esta informacion, leela aqui:',
      url: url,
    );
  }

  static List<Breed> getListFilter({
    required List<Breed> listBreed,
    required String search,
  }) {
    final listFilter = listBreed
        .where(
          (element) =>
              element.name.toUpperCase().contains(search.toUpperCase()) ||
              element.description.toUpperCase().contains(search.toUpperCase()),
        )
        .toList();
    return listFilter;
  }
}
