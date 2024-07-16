import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wsiiz_tp/application/auth/auth_controller.dart';
import 'package:wsiiz_tp/core/utils/extensions.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTile(
              title: Text(context.s.logout),
              tileColor: context.colorScheme.surfaceContainer,
              onTap: () {
                ref.read(authControllerProvider.notifier).signOut();
                Navigator.pop(context);
              },
              trailing: const Icon(Icons.logout),
            ),
            const SizedBox(height: 12),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final packageInfo = snapshot.data!;
                  return Text(
                    'v${packageInfo.version}',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      color: context.colorScheme.onSurfaceVariant
                          .withOpacity(0.70),
                    ),
                    textAlign: TextAlign.center,
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
