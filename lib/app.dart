import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wsiiz_tp/application/auth/auth_controller.dart';
import 'package:wsiiz_tp/core/navigation/app_router.dart';
import 'package:wsiiz_tp/core/theme/app_theme.dart';

import 'package:wsiiz_tp/features/wrapper/site_wrapper.dart';
import 'package:wsiiz_tp/gen/l10n.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    ref.watch(authControllerProvider);

    return MaterialApp.router(
      theme: AppTheme.themeData,
      routerConfig: appRouter.config(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) => SiteWrapper(
        child: child,
      ),
    );
  }
}
