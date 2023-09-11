import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/07_store_detail_object.dart';


class RegisterStoreDetailObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(StoreDetailObjectAdapter());
    }
    await Hive.openBox<StoreDetailObject>("StoreDetailObject");
  }
}