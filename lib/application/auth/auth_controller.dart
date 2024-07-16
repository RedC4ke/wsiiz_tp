import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wsiiz_tp/application/base/base_controller_mixin.dart';
import 'package:wsiiz_tp/application/base/loadable_state.dart';
import 'package:wsiiz_tp/domain/auth/auth_repository.dart';
import 'package:wsiiz_tp/domain/error/models/failure.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController with BaseControllerMixin {
  @override
  LoadableState<User> build() {
    ref.onDispose(() async {
      await _userSubscription?.cancel();
    });

    _init();

    return const LoadableState.loading();
  }

  StreamSubscription<Either<Failure, User>>? _userSubscription;

  void _init() {
    _userSubscription = ref
        .read(
          authRepositoryProvider,
        )
        .userStream
        .listen(
          _userListener,
        );
  }

  void _userListener(Either<Failure, User> user) {
    user.fold(
      (_) => state = const LoadableState.initial(),
      (user) => state = LoadableState.success(user),
    );
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    state = const LoadableState.loading();

    final result = await ref
        .read(authRepositoryProvider)
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .run();

    result.fold(
      (f) => state = LoadableState.error(f),
      (user) => state = LoadableState.success(user),
    );
  }

  Future<void> signOut() async {
    state = const LoadableState.loading();

    final result = await ref.read(authRepositoryProvider).signOut().run();

    result.fold(
      (f) => state = LoadableState.error(f),
      (_) => state = const LoadableState.initial(),
    );
  }
}
