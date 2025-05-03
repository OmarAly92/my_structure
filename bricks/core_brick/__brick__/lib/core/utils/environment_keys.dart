sealed class EnvironmentKeys {
  static const encryptKey = String.fromEnvironment('ENCRYPT_KEY');
  static const encryptIV = String.fromEnvironment('ENCRYPT_IV');
}