import 'dart:convert';

import 'package:my_structure/core/helpers/encrypt_helper/encrypt_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class PrefHelper {
  static late final SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<bool> save(String key, dynamic value) async {
    if (value == null) return false;
    final String encryptedValue = Encryptor.encryptData(value.toString());
    return await _pref.setString(key, encryptedValue);
  }

  static dynamic get(String key, {bool getValueEncrypted = false}) {
    final String? encryptedValue = _pref.get(key) as String?;
    if (encryptedValue == null) return null;
    if (getValueEncrypted) return encryptedValue;

    final String decryptedValue = Encryptor.decryptData(encryptedValue);

    /// Attempt to parse as bool
    if (decryptedValue == 'true' || decryptedValue == 'false') {
      return decryptedValue == 'true';
    }

    /// Attempt to parse as num
    final num? parsedNum = num.tryParse(decryptedValue);
    if (parsedNum != null) return parsedNum;

    /// Attempt to parse as a list (assuming a comma-separated string)
    if (decryptedValue.startsWith('[') && decryptedValue.endsWith(']')) {
      return decryptedValue
          .substring(1, decryptedValue.length - 1)
          .split(',')
          .map((e) => e.trim())
          .toList();
    }

    /// Attempt to parse as a map
    if (decryptedValue.startsWith('{') && decryptedValue.endsWith('}')) {
      try {
        return Map<String, dynamic>.from(jsonDecode(decryptedValue) as Map);
      } catch (_) {
        /// Return raw string if parsing fails
        return decryptedValue;
      }
    }

    /// Attempt to parse as DateTime
    final DateTime? parsedDateTime = DateTime.tryParse(decryptedValue);
    if (parsedDateTime != null) return parsedDateTime;

    /// Return as plain string if no other parsing succeeds
    return decryptedValue;
  }

  static Future<bool> remove(String key) async {
    return await _pref.remove(key);
  }

  static Future<bool> clear() async {
    return await _pref.clear();
  }

  /// OLD save without encryption
  // static Future<bool> save(String key, dynamic value) async {
  //   if (value == null) return false;
  //   if (value is String) {
  //     return await _pref.setString(key, value);
  //   } else if (value is int) {
  //     return await _pref.setInt(key, value);
  //   } else if (value is bool) {
  //     return await _pref.setBool(key, value);
  //   } else if (value is double) {
  //     return await _pref.setDouble(key, value);
  //   } else if (value is List<String>) {
  //     return await _pref.setStringList(key, value);
  //   } else {
  //     throw UnsupportedError('Type not supported for SharedPreferences');
  //   }
  // }
}
