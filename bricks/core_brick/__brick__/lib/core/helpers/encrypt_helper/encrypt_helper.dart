import 'dart:convert';
import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:my_structure/core/utils/environment_keys.dart';

sealed class Encryptor {
  static const String _keyString = EnvironmentKeys.encryptKey;
  static const String _ivString = EnvironmentKeys.encryptIV;

  static final encrypt.Key _key = encrypt.Key.fromBase64(_keyString);
  static final encrypt.IV _iv = encrypt.IV.fromBase64(_ivString);
  static final encrypt.Encrypter _encryptor = encrypt.Encrypter(
    encrypt.AES(
      _key,
      mode: encrypt.AESMode.cbc,
    ),
  );

  static String encryptData(String data) {
    /// Generate a random nonce (16 bytes)
    final nonce = List<int>.generate(16, (i) => Random.secure().nextInt(256));
    final nonceBase64 = base64Encode(nonce);

    /// Combine nonce with the actual data
    final combinedData = nonceBase64 + data;

    /// Encrypt the combined data
    final encrypted = _encryptor.encrypt(combinedData, iv: _iv);
    return encrypted.base64;
  }

  static String decryptData(String data) {
    /// Decrypt the data
    final decrypted = _encryptor.decrypt64(data, iv: _iv);

    /// Extract the nonce (first 24 characters after base64 encoding)
    /// final extractedNonce = decrypted.substring(0, 24);

    /// Extract the original data (after the nonce)
    final originalData = decrypted.substring(24);

    return originalData;
  }
}


