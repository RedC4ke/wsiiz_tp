import 'package:flutter/material.dart';
import 'package:wsiiz_tp/application/base/loadable_state.dart';

abstract class Listeners {
  static void loadableStateListener(
    BuildContext context,
    String successMessage,
    LoadableState<dynamic>? previous,
    LoadableState<dynamic> next, {
    bool popOnSuccess = true,
  }) {
    next.maybeWhen(
      success: (data) {
        if (popOnSuccess) {
          Navigator.of(context).pop(data);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(successMessage),
          ),
        );
      },
      error: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
          ),
        );
      },
      orElse: () {},
    );
  }
}
