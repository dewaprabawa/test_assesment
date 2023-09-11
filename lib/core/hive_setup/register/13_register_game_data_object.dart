import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/13_game_data_object.dart';


class RegisterGameDataObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(13)) {
      Hive.registerAdapter(GameDataObjectAdapter());
    }
    await Hive.openBox<GameDataObject>("GameDataObject");
  }
}