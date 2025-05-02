import 'package:flutter/material.dart';

/// TODO COLORS

class AppPopupMenuItem<T> extends PopupMenuItem<T> {
  const AppPopupMenuItem({
    super.key,
    super.value,
    this.checked = false,
    super.enabled,
    super.padding = EdgeInsets.zero,
    super.height = 0,
    super.labelTextStyle,
    super.mouseCursor,
    required super.child,
    super.onTap,
  });

  final bool checked;

  @override
  PopupMenuItemState<T, AppPopupMenuItem<T>> createState() => _AppPopupMenuItemState<T>();
}

class _AppPopupMenuItemState<T> extends PopupMenuItemState<T, AppPopupMenuItem<T>> {
  @override
  Widget buildChild() {
    return IgnorePointer(
      child: ListTileTheme.merge(
        contentPadding: EdgeInsets.zero,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 7,
                ),
                // color: widget.checked ? AppColors.sg02 : null,
                child: widget.child ?? const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
