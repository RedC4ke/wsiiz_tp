import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wsiiz_tp/core/utils/extensions.dart';
import 'package:wsiiz_tp/core/widgets/custom_expansion_tile.dart';
import 'package:wsiiz_tp/domain/devices/models/device_model.dart';

class DeviceTile extends HookWidget {
  const DeviceTile({
    required this.device,
    required this.children,
    required this.allDevices,
    super.key,
  });

  final DeviceModel device;
  final List<DeviceModel> children;
  final List<DeviceModel> allDevices;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    final secondaryStyle = context.textTheme.bodyMedium?.copyWith(
      color: context.colorScheme.onSurface.withOpacity(0.6),
    );

    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: ColoredBox(
            color: context.colorScheme.surface,
            child: CustomExpansionTile(
              expandable: children.isNotEmpty,
              title: Row(
                children: [
                  const SizedBox(width: 8),
                  device.type.icon.image(
                    height: 36,
                    width: 36,
                    color: context.colorScheme.onSurface,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(device.name),
                      Row(
                        children: [
                          Text(
                            '${context.s.status}: ${device.available ? context.s.online : context.s.offline}',
                          ),
                          const SizedBox(width: 6),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              color:
                                  device.available ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 26),
                  ElevatedButton(
                    onPressed: () {
                      launchUrlString(
                        'http://maps.google.com/maps?z=18&t=m&q=loc:${device.location.latitude}+${device.location.longitude}',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: context.textTheme.bodyMedium,
                    ),
                    child: Text(
                      context.s.find,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.s.model}: ${device.model ?? 'N/A'}',
                        style: secondaryStyle,
                      ),
                      Text(
                        '${context.s.brand}: ${device.brand ?? 'N/A'}',
                        style: secondaryStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IPv4: ${device.ip}',
                        style: secondaryStyle,
                      ),
                      Text(
                        '${context.s.mask}: ${device.mask ?? 'N/A'}',
                        style: secondaryStyle,
                      ),
                    ],
                  ),
                ],
              ),
              isExpanded: isExpanded.value,
              onExpansionChanged: (p0) => isExpanded.value = p0,
            ),
          ),
        ),
        if (isExpanded.value)
          SliverStack(
            children: [
              SliverPositioned(
                top: 8,
                bottom: 0,
                left: 0,
                child: Container(
                  width: 2,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              MultiSliver(
                children: [
                  ...children.map((c) {
                    return SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        8,
                        0,
                        0,
                      ),
                      sliver: DeviceTile(
                        device: c,
                        children: allDevices
                            .where((d) => d.parent?.id == c.id)
                            .toList(),
                        allDevices: allDevices,
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
