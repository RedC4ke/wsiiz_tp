import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wsiiz_tp/application/auth/auth_controller.dart';
import 'package:wsiiz_tp/core/utils/extensions.dart';
import 'package:wsiiz_tp/core/utils/validators.dart';
import 'package:wsiiz_tp/core/widgets/app_loading.dart';

@RoutePage()
class AuthPage extends HookConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    void login() {
      if (formKey.currentState?.validate() != true) {
        return;
      }

      ref.read(authControllerProvider.notifier).signInWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          );
    }

    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: Center(
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.s.login_header,
                      style: context.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: context.s.email,
                      ),
                      validator: (v) => Validators.notEmpty(context, v),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: context.s.password,
                      ),
                      validator: (v) => Validators.notEmpty(context, v),
                      obscureText: true,
                      onFieldSubmitted: (_) {
                        login();
                      },
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: login,
                        child: Text(context.s.login),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const AppLoading(
              transparent: false,
            ),
          ),
        ],
      ),
    );
  }
}
