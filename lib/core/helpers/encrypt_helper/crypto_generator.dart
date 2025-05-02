import 'dart:convert';
import 'dart:math' show Random;
import 'dart:typed_data';


sealed class CryptoGenerator {
  static void generateKeyAndIv() {
    // Generate 256-bit (32-byte) key for AES-256
    final key = Uint8List(32);
    final iv = Uint8List(16); // 128-bit IV for CBC mode

    final random = Random.secure();
    for (int i = 0; i < key.length; i++) {
      key[i] = random.nextInt(256);
    }
    for (int i = 0; i < iv.length; i++) {
      iv[i] = random.nextInt(256);
    }

      print('Generated Key (base64): ${base64Encode(key)}');
      print('Generated IV (base64): ${base64Encode(iv)}');
  }
}

void main() {
  CryptoGenerator.generateKeyAndIv();
}
