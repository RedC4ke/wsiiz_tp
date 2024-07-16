import 'package:auto_route/auto_route.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wsiiz_tp/features/auth/auth_page.dart';
import 'package:wsiiz_tp/features/auth/auth_wrapper_page.dart';
import 'package:wsiiz_tp/features/panel/panel_page.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthWrapperRoute.page,
          initial: true,
          children: [
            AutoRoute(page: AuthRoute.page, initial: true),
            AutoRoute(page: PanelRoute.page),
          ],
        ),
      ];
}
