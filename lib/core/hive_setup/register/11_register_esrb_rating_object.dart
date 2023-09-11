import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/11_esrb_rating_object.dart';


class RegisterEsrbRatingObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(11)) {
      Hive.registerAdapter(EsrbRatingObjectAdapter());
    }
    await Hive.openBox<EsrbRatingObject>("EsrbRatingObject");
  }
}