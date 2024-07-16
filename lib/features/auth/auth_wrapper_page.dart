import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wsiiz_tp/application/auth/auth_controller.dart';
import 'package:wsiiz_tp/core/navigation/app_router.dart';

@RoutePage()
class AuthWrapperPage extends ConsumerWidget {
  const AuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    return AutoRouter.declarative(
      routes: (_) => state.maybeWhen(
        success: (_) => const [
          PanelRoute(),
        ],
        orElse: () => const [
          AuthRoute(),
        ],
      ),
    );
  }
}
