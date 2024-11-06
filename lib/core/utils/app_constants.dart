import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_structure/core/app_themes/colors/app_dynamic_colors.dart';
import 'package:my_structure/core/error_handling/failures/failure.dart';
import 'package:my_structure/core/error_handling/failures/local_failure.dart';
import 'package:my_structure/core/error_handling/failures/server_failure.dart';
import 'package:my_structure/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

sealed class AppConstants {
  static const int slideAnimation = 350;
  static const int fadInAnimation = 350;

  /// Apply this on all project
  static const double borderRadius = 8;
  static BorderRadius borderRadiusCircular = BorderRadius.circular(borderRadius);
  static const double horizontalPadding = 10;

  static String dateFormat(DateTime date) {
    String result = DateFormat('yyyy-MM-dd').format(date);
    return result;
  }
}
