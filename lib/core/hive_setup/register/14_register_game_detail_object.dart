import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/14_game_detail_object.dart';


class RegisterGameDetailObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(14)) {
      Hive.registerAdapter(GameDetailObjectAdapter());
    }
    await Hive.openBox<GameDetailObject>("GameDetailObject");
  }
}