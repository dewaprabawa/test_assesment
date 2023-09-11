import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/10_requirement_object.dart';


class RegisterRequirementObject {
  static Future<void> register() async {
    if (!Hive.isAdapterRegistered(10)) {
      Hive.registerAdapter(RequirementsObjectAdapter());
    }
    await Hive.openBox<RequirementsObject>("RequirementsObject");
  }
}