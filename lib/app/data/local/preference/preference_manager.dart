import 'package:get_storage/get_storage.dart';

class PreferenceManager implements IPreferenceManager {
  static final GetStorage _storage = GetStorage();

  @override
  T getValue<T>(String key, {T? defaultValue}) =>
      _storage.read<T>(key) ?? defaultValue as T;

  @override
  Future<void> setValue<T>(String key, T value) => _storage.write(key, value);
}

abstract class IPreferenceManager {
  static const userAuthToken = 'auth_token';

  T getValue<T>(String key, {T? defaultValue});

  Future<void> setValue<T>(String key, T value);
}
