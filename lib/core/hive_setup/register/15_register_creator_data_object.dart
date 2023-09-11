
import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/15_creator_data_object.dart';


class RegisterCreatorDataObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(15)) {
      Hive.registerAdapter(CreatorDataObjectAdapter());
    }
    await Hive.openBox<CreatorDataObject>("CreatorDataObject");
  }
}