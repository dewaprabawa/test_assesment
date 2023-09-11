import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'register/export_register.dart';


class HiveSetupDB {
  static Future<void> init() async {
    final document = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(document.path);
    await RegisterStoreObject.register();
    await RegisterGenreObject.register();
    await RegisterRatingObject.register();
    await RegisterShortScreenshotObject.register();
    await RegisterPlatformObject.register();
    await RegisterDeveloperObject.register();
    await RegisterStoreDetailObject.register();
    await RegisterPlatformElementDetailObject.register();
    await RegisterRequirementObject.register();
    await RegisterEsrbRatingObject.register();
    await RegisterParentPlatformObject.register();
    await RegisterGameObject.register();
    await RegisterCreatorDataObject.register();
    await RegisterGameDataObject.register();
    await RegisterGameDetailObject.register();
  }
}