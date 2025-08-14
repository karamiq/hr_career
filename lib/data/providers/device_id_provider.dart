import 'package:app/common_lib.dart';
import 'package:app/data/shared_preference/shared_preferences_lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'device_id_provider.g.dart';

@riverpod
String uniqueId(Ref ref) {
  const String key = Preferences.deviceId;
  final prefs = ref.read(sharedPreferencesProvider);

  String? id = prefs.getString(key);

  if (id == null) {
    id = const Uuid().v4();
    prefs.setString(key, id);
  }

  return id;
}
