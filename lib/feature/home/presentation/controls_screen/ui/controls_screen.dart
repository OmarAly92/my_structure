import 'package:flutter/material.dart';
import 'package:my_structure/core/widgets/main_widgets/app_scaffold.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:my_structure/core/widgets/main_widgets/global_appbar.dart';

class ControlsScreen extends StatelessWidget {
  const ControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appBar: GlobalAppbar(
        titleText: 'Controls',
      ),
      body: Center(
        child: AppText('Controls Screen'),
      ),
    );
  }
}
