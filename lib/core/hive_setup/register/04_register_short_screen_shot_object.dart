import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/04_short_screen_shot_object.dart';

class RegisterShortScreenshotObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(ShortScreenshotObjectAdapter());
    }
    await Hive.openBox<ShortScreenshotObject>("ShortScreenshotObject");
  }
}