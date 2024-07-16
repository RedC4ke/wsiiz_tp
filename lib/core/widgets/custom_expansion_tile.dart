import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wsiiz_tp/core/utils/extensions.dart';

class CustomExpansionTile extends HookWidget {
  const CustomExpansionTile({
    required this.title,
    required this.isExpanded,
    this.onExpansionChanged,
    this.padding,
    this.leading,
    this.backgroundColor,
    this.expandable = true,
    super.key,
  });

  final Widget? leading;
  final EdgeInsets? padding;
  final Widget title;
  final bool isExpanded;
  final void Function(bool)? onExpansionChanged;
  final Color? backgroundColor;
  final bool expandable;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor ?? context.colorScheme.secondaryContainer,
      ),
      child: Material(
        elevation: 4,
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            if (onExpansionChanged != null) {
              onExpansionChanged?.call(!isExpanded);
            }
          },
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
            child: Row(
              children: [
                if (leading != null) leading!,
                Expanded(
                  child: title,
                ),
                const SizedBox(width: 12),
                if (expandable)
                  AnimatedRotation(
                    turns: isExpanded ? -0.25 : 0.25,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
