import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wsiiz_tp/application/base/loadable_state.dart';
import 'package:wsiiz_tp/core/navigation/app_router.dart';

mixin BaseControllerMixin<T extends LoadableState<dynamic>>
    on AutoDisposeNotifier<T> {
  @override
  set state(T value) {
    value.maybeWhen(
      error: (failure) {
        showSnackBar(failure.message, error: true);
      },
      orElse: () {},
    );
    super.state = value;
  }

  void showSnackBar(String message, {bool error = false}) {
    final context = ref.read(appRouterProvider).navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
}
