sealed class AppAsset {
  static const String _images = 'assets/images';
  static const String _icons = 'assets/icons';
  static const String _translations = 'assets/translations';

  static String get translations => _translations;

  /// Images
  static const String errorImage = '$_images/error_image.png';

  /// Icons
  static const String arrowBackIcon = '$_icons/back_icon.svg';
}
