import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wsiiz_tp/application/auth/auth_controller.dart';
import 'package:wsiiz_tp/core/utils/extensions.dart';
import 'package:wsiiz_tp/features/wrapper/app_drawer.dart';

class SiteWrapper extends ConsumerWidget {
  const SiteWrapper({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    final authorized = authState.maybeWhen(
      orElse: () => false,
      success: (_) => true,
    );

    return Stack(
      children: [
        Scaffold(
          drawer: const AppDrawer(),
          body: ColoredBox(
            color: context.colorScheme.surface,
            child: Scrollbar(
              interactive: true,
              thickness: 18,
              child: ScrollConfiguration(
                behavior: const MaterialScrollBehavior().copyWith(
                  scrollbars: false,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (authorized)
                      Builder(
                        builder: (context) {
                          return Row(
                            children: [
                              Container(
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(24),
                                  ),
                                  color: context.colorScheme.secondaryContainer,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: const Icon(Icons.menu),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    else
                      const SizedBox(),
                    const SizedBox(
                      width: 36,
                    ),
                    Expanded(
                      child: Center(
                        child: child ?? const SizedBox(),
                      ),
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                    if (authorized)
                      const SizedBox(
                        width: 60,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
