import 'package:flutter/material.dart';
import 'package:my_structure/core/widgets/main_widgets/app_container.dart';
import 'package:my_structure/core/widgets/screens_components/account_multi_tile_item.dart';

class AccountMultiTile extends StatelessWidget {
  const AccountMultiTile({super.key, required this.items});

  final List<AccountTileParams> items;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.zero,
      child: Column(
        children: List.generate(items.length, (index) {
          return AccountMultiTileItem(
            params: items[index],
            currentIndex: index,
            itemLength: items.length,
          );
        }),
      ),
    );
  }
}
