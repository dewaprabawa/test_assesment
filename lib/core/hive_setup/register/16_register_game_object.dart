
import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/16_game_object.dart';

class RegisterGameObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(16)) {
      Hive.registerAdapter(GameObjectAdapter());
    }
    await Hive.openBox<GameObject>("GameObject");
  }
}