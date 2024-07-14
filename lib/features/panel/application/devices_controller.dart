import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wsiiz_tp/application/base/loadable_state.dart';
import 'package:wsiiz_tp/domain/devices/devices_repository.dart';
import 'package:wsiiz_tp/domain/devices/models/device_model.dart';

part 'devices_controller.g.dart';

@riverpod
class DevicesController extends _$DevicesController {
  @override
  LoadableState<List<DeviceModel>> build() {
    _init();

    return const LoadableState.loading();
  }

  void _init() {
    loadDevices();
  }

  Future<void> loadDevices() async {
    final devices =
        await ref.read(devicesRepositoryProvider).getDevices().run();

    state = devices.fold(
      LoadableState.error,
      LoadableState.success,
    );
  }
}
