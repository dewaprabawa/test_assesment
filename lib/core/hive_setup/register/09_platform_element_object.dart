import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/09_platform_element_object.dart';


class RegisterPlatformElementDetailObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(9)) {
      Hive.registerAdapter(PlatformElementObjectAdapter());
    }
    await Hive.openBox<PlatformElementObject>("PlatformElementObject");
  }
}