import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_structure/core/helpers/localization/locale_keys.g.dart';
import 'package:my_structure/core/widgets/main_widgets/app_scaffold.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:my_structure/core/widgets/main_widgets/custom_appbar.dart';

class ControlsScreen extends StatelessWidget {
  const ControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppbar(
        titleText: LocaleKeys.controls.tr().toUpperCase(),
      ),
      body: Center(
        child: AppText('Controls Screen'),
      ),
    );
  }
}
