import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/06_developer_object.dart';


class RegisterDeveloperObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(DeveloperObjectAdapter());
    }
    await Hive.openBox<DeveloperObject>("DeveloperObject");
  }
}