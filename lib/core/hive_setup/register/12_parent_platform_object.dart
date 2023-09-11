import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/12_parent_platform_object.dart';


class RegisterParentPlatformObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(12)) {
      Hive.registerAdapter(ParentPlatformObjectAdapter());
    }
    await Hive.openBox<ParentPlatformObject>("ParentPlatformObject");
  }
}