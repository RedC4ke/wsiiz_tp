import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wsiiz_tp/core/utils/extensions.dart';
import 'package:wsiiz_tp/core/widgets/app_loading.dart';
import 'package:wsiiz_tp/features/panel/application/devices_controller.dart';
import 'package:wsiiz_tp/features/panel/widgets/device_tile.dart';
import 'package:wsiiz_tp/features/panel/widgets/panel_search_bar.dart';

@RoutePage()
class PanelPage extends ConsumerWidget {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(devicesControllerProvider);

    return CustomScrollView(
      cacheExtent: 1000,
      slivers: [
        SliverAppBar(
          leading: const SizedBox(),
          toolbarHeight: 60 + (2 * 10),
          surfaceTintColor: Colors.transparent,
          backgroundColor: context.colorScheme.surfaceDim,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              bottom: 18,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                color: context.colorScheme.secondaryContainer,
              ),
              child: const Center(
                child: PanelSearchBar(),
              ),
            ),
          ),
          pinned: true,
        ),
        ...state.maybeWhen(
          orElse: () => [const SliverToBoxAdapter(child: AppLoading())],
          success: (data) {
            // final filteredData = data.where((d) {
            //   final search = searchState?.toLowerCase() ?? '';
            //   final name = d.name.toLowerCase();
            //   final brand = d.brand?.toLowerCase() ?? '';
            //   final model = d.model?.toLowerCase() ?? '';
            //   final ip = d.ip?.toString() ?? '';
            //   final mask = d.mask?.toString() ?? '';

            //   return name.contains(search) ||
            //       brand.contains(search) ||
            //       model.contains(search) ||
            //       ip.contains(search) ||
            //       mask.contains(search);
            // }).toList();

            return data
                .where((d) => d.parent == null)
                .map(
                  (d) => DeviceTile(
                    device: d,
                    children: data.where((c) => c.parent?.id == d.id).toList(),
                    allDevices: data,
                  ),
                )
                .toList();
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }
}
