import 'package:auto_route/auto_route.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wsiiz_tp/features/auth/auth_page.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, initial: true),
      ];
}
