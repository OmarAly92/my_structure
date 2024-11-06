import 'package:flutter/material.dart';
import 'package:my_structure/core/widgets/main_widgets/app_scaffold.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: AppText('Home Screen'),
      )
    );
  }
}