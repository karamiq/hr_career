import 'package:app/core/providers/provider.dart';
import 'package:app/data/providers/authentication_provider.dart';
import 'package:app/data/services/auth_client.dart';
import 'package:app/data/shared_preference/preferences.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'access_token_provider.g.dart';

@riverpod
class AccessToken extends _$AccessToken {
  @protected
  String get key => Preferences.accessToken;

  @protected
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  @override
  String? build() {
    final storedToken = prefs.getString(key);
    return storedToken;
  }

  /// Safely get the token, or return null if not loaded
  String? get() => state;

  /// Update the token manually and store it in SharedPreferences
  Future<void> setToken(String token) async {
    state = token;
    await prefs.setString(key, token);
  }

  Future<String> newToken() async {
    final token = await ref.read(authClientProvider).accessToken();
    if (token.response.statusCode == 401) {
      ref.read(authenticationProvider.notifier).logout();
    }

    final data = token.data.data;
    await setToken(data);
    return data;
  }

  // ignore: avoid_public_notifier_properties
  bool get exists => state != null && state!.isNotEmpty;
}
