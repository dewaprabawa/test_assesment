import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/02_genre_object.dart';


class RegisterGenreObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(GenreObjectAdapter());
    }
    await Hive.openBox<GenreObject>("GenreObject");
  }
}