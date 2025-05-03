import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_structure/core/helpers/localization/locale_keys.g.dart';

sealed class AppFormValidations {
  /// Name Validation
  // Allows letters, numbers, underscores, dots, and dashes.
  static final List<TextInputFormatter> userNameFormater = [
    FilteringTextInputFormatter.allow(
      RegExp(r'^[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FFa-zA-Z0-9]*$'),
    ),
  ];
  static String? userNameValidator(String? value) {
    const userNamePattern =
        r'^[a-zA-Z0-9_.-]{3,16}$'; // Adjust length limits as needed.
    if (value == null || value.isEmpty) {
      return LocaleKeys.usernameIsRequired.tr();
    } else if (!RegExp(userNamePattern).hasMatch(value)) {
      return LocaleKeys.userNameMustBe316Character.tr();
    }
    return null;
  }

  /// Email Validation
  // Email Input Formatter: Allows only valid email characters.
  static final List<TextInputFormatter> emailFormater = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-]')),
  ];

  static final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emailIsRequired.tr();
    } else if (!AppFormValidations.emailRegex.hasMatch(value)) {
      return LocaleKeys.enterValidEmail.tr();
    }
    return null;
  }

  static String? emailAndPhoneValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emailIsRequired.tr();
    } else if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      return LocaleKeys.enterValidEmailOrPhoneNumber.tr();
    }
    return null;
  }

  static final phoneRegex = RegExp(
    r'^\+?[1-9]\d{1,14}$|^(\+?\d{1,3})?(\d{10})$|^(\d{3})[-.\s]?\d{3}[-.\s]?\d{4}$',
  );

  /// Otp Validation
  static final List<TextInputFormatter> otpFormater = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  ];

  static String? otpValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.codeIsRequired.tr();
    } else if (value.length != 6) {
      return LocaleKeys.enterValidCode.tr();
    }
    return null;
  }

  /// Password Validation
  // Password Input Formatter: Allows alphanumeric and special characters (e.g., !@#$%^&*).
  static final List<TextInputFormatter> passwordFormater = [
    FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:"\\|,.<>/?~` ]'),
    ),
  ];

  static String? passwordValidation(String? value) {
    if (kDebugMode) return null;
    if (value == null || value.isEmpty) {
      return LocaleKeys.passwordIsRequired.tr();
    } else if (value.length < 8) {
      return LocaleKeys.passwordMustBeAtLeast8Characters.tr();
    } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return LocaleKeys.passwordMustContainLetters.tr();
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return LocaleKeys.passwordMustContainNumbers.tr();
    }
    return null;
  }

  static String? confirmPasswordValidation(
    String? confirmPassword,
    String? password,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return LocaleKeys.passwordIsRequired.tr();
    } else if (confirmPassword.length < 8) {
      return LocaleKeys.passwordMustBeAtLeast8Characters.tr();
    } else if (confirmPassword != password) {
      return LocaleKeys.passwordsDoNotMatch.tr();
    }
    return null;
  }

  /// Phone Number Validation
  // Allows digits, spaces, plus (+), and hyphens (-).
  static final List<TextInputFormatter> phoneNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only digits
    LengthLimitingTextInputFormatter(11), // Limit input length to 11
  ];

  static String? phoneNumberValidator(String? value) {
    const phoneNumberPattern = r'^\d{11}$'; // Match exactly 11 digits
    if (value == null || value.isEmpty) {
      return LocaleKeys.phoneNumberIsRequired.tr();
    } else if (!RegExp(phoneNumberPattern).hasMatch(value)) {
      return LocaleKeys.enterValidPhoneNumber.tr();
    }
    return null;
  }

  /// Card Number Validation And Formater
  static final List<TextInputFormatter> cardNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only digits
    LengthLimitingTextInputFormatter(16), // Limit input length to 16
  ];
  static String? cardNumberValidator(String? value) {
    const cardNumberPattern = r'^\d{16}$'; // Match exactly 16 digits
    if (value == null || value.isEmpty) {
      return LocaleKeys.cardNumberIsRequired.tr();
    } else if (!RegExp(cardNumberPattern).hasMatch(value)) {
      return LocaleKeys.enterValidCardNumber.tr();
    }
    return null;
  }

  /// Card Expiry Date Validation And Formater
  static final List<TextInputFormatter> cardExpiryDateFormatter = [
    FilteringTextInputFormatter.allow(
      RegExp(r'[0-9/]'),
    ), // Allow only digits and slash
    LengthLimitingTextInputFormatter(6), // Limit input length to 5
  ];
  static String? cardExpiryDateValidator(String? value) {
    const cardExpiryDatePattern =
        r'^(0[1-9]|1[0-2])\/\d{2}$'; // Match MM/YY format
    if (value == null || value.isEmpty) {
      return LocaleKeys.cardExpiryDateIsRequired.tr();
    } else if (!RegExp(cardExpiryDatePattern).hasMatch(value)) {
      return LocaleKeys.enterValidCardExpiryDate.tr();
    }
    return null;
  }

  /// Card Security Code Validation And Formater
  static final List<TextInputFormatter> cardSecurityCodeFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only digits
    LengthLimitingTextInputFormatter(3), // Limit input length to 3
  ];

  static String? cardSecurityCodeValidator(String? value) {
    const cardSecurityCodePattern = r'^\d{3}$'; // Match exactly 3 digits
    if (value == null || value.isEmpty) {
      return LocaleKeys.cardSecurityCodeIsRequired.tr();
    } else if (!RegExp(cardSecurityCodePattern).hasMatch(value)) {
      return LocaleKeys.enterValidCardSecurityCode.tr();
    }
    return null;
  }
}
