import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/05_platform_object.dart';

class RegisterPlatformObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(PlatformObjectAdapter());
    }
    await Hive.openBox<PlatformObject>("PlatformObject");
  }
}