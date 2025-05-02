import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:image_picker/image_picker.dart';
import 'package:my_structure/core/helpers/helper_functions/app_logger.dart';
import 'package:my_structure/core/helpers/shared_preference/preference_helper.dart';
import 'package:my_structure/core/helpers/shared_preference/preference_keys.dart';
import 'package:my_structure/core/utils/extensions.dart';
import 'package:safe_device/safe_device.dart';
import 'package:url_launcher/url_launcher.dart';

sealed class AppMethods {
  /// todo; use global key context
  static Future<void> appLaunchUrl(
    BuildContext context, {
    required String urlLink,
  }) async {
    final url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      if (context.mounted) {
        context.showSnackBar('Could not launch $urlLink');
      }
    }
  }

  static String dateTimeFormat(DateTime date) {
    final String result = DateFormat('yyyy-MM-dd').format(date);
    return result;
  }

  static String hourFormat(BuildContext context, {required int? date}) {
    if (date == null) return 'Invalid date'; // Handle null case

    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);

    // Format time without changing number style
    String formattedTime = DateFormat(
      'h:mm a',
      'en',
    ).format(dateTime); // Keep English numbers

    // Replace AM/PM with Arabic only if locale is Arabic
    if (context.isArabic) {
      formattedTime = formattedTime.replaceAll('AM', 'ص').replaceAll('PM', 'م');
    }

    return formattedTime;
  }

  static String convertMinutes(int minutes) {
    if (minutes < 60) {
      return '$minutes ${'LocaleKeys.min.tr()'}'; // Less than an hour, show in minutes
    }

    final int hours = minutes ~/ 60; // Integer division for hours
    final int mins = minutes % 60; // Get remaining minutes

    if (mins == 0) {
      return '$hours:00'; // Show full hours like "1:00"
    } else {
      return "$hours:${mins.toString().padLeft(2, '0')}"; // Format "H:MM"
    }
  }

  static bool isAuthorization() => PrefHelper.get(PrefKeys.token) != null;

  static String formatDateToMonthNameAndDayNameStamp(
    BuildContext context, {
    required int? timestamp, // Accepts timestamp (in seconds)
  }) {
    // Handle null timestamp
    if (timestamp == null) return '';

    // Convert timestamp to DateTime
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Format the date based on the locale
    if (context.isArabic) {
      // Format the date in Arabic
      final DateFormat arabicFormat = DateFormat('EEEE d MMMM', 'ar');
      final String arabicDate = arabicFormat.format(date);
      return arabicDate;
    } else {
      // Format the date in English
      final DateFormat englishFormat = DateFormat('EEEE d MMMM', 'en');
      final String englishDate = englishFormat.format(date);
      return englishDate;
    }
  }

  static String formatDateToMonthNameAndDayName(
    BuildContext context, {
    required String? inputDate,
  }) {
    // Handle null or empty input
    if (inputDate == null || inputDate.isEmpty) return '';

    // Parse the input date string into a DateTime object
    final DateFormat inputFormat = DateFormat('yyyy-MM-dd'); // Updated format
    DateTime? date;
    try {
      date = inputFormat.parse(inputDate);
    } catch (e) {
      // Handle parsing errors (e.g., invalid format)
      return '';
    }

    // Format the date based on the locale
    if (context.isArabic) {
      // Format the date in Arabic
      final DateFormat arabicFormat = DateFormat('EEEE d MMMM', 'ar');
      final String arabicDate = arabicFormat.format(date);
      return arabicDate;
    } else {
      // Format the date in English
      final DateFormat englishFormat = DateFormat('EEEE d MMMM', 'en');
      final String englishDate = englishFormat.format(date);
      return englishDate;
    }
  }

  static Future<bool> get isSafeDevice async {
    try {
      final allSafeDeviceChecks = await Future.wait([
        SafeDevice.isJailBroken,
        SafeDevice.isRealDevice,
        SafeDevice.isMockLocation,
        SafeDevice.isOnExternalStorage,
      ]);
      final bool jailBroken = allSafeDeviceChecks[0];
      final bool realDevice = allSafeDeviceChecks[1];
      final bool mockLocation = allSafeDeviceChecks[2];
      final bool onExternalStorage =
          Platform.isAndroid ? allSafeDeviceChecks[3] : false;
      AppLogger.info(
        '\n'
        'Real Device: $realDevice\n'
        'Rooted Or JailBroken: $jailBroken\n'
        'MockLocation: $mockLocation\n'
        'onExternalStorage: $onExternalStorage',
      );

      return !(jailBroken || mockLocation || !realDevice || onExternalStorage);
    } catch (e) {
      return false;
    }
  }

  static Future<void> changeLanguage(
    BuildContext context, {
    required Locale locale,
  }) async {
    await EasyLocalization.of(context)!.setLocale(locale);
    await PrefHelper.save(PrefKeys.currentLanguage, locale.languageCode);
    // DioConsumer().setDioOptions();
  }

  static String? parseHtmlString(String? htmlString) {
    if (htmlString == null) return null;
    final dom.Document document = html_parser.parse(htmlString);
    return document.body?.text ?? '';
  }

  static void logout() {
    PrefHelper.remove(PrefKeys.token);
  }

  static Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<void> copyClipboard(String response) async {
    await Clipboard.setData(ClipboardData(text: response));
  }
}
