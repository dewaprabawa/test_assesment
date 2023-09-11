import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/01_store_object.dart';


class RegisterStoreObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(StoreObjectAdapter());
    }
    await Hive.openBox<StoreObject>("StoreObject");
  }
}