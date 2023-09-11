import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/03_rating_object.dart';

class RegisterRatingObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(RatingObjectAdapter());
    }
    await Hive.openBox<RatingObject>("RatingObject");
  }
}