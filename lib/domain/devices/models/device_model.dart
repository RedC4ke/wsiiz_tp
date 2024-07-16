import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wsiiz_tp/core/utils/converters.dart';
import 'package:wsiiz_tp/domain/devices/models/location_model.dart';
import 'package:wsiiz_tp/gen/assets.gen.dart';

part 'device_model.g.dart';

@JsonEnum()
enum DeviceType {
  @JsonValue('switch')
  networkSwitch,
  router,
  accessPoint,
  modem,
  drive,
  computer,
  printer,
  server,
  @JsonValue('VLAN')
  vlan
}

extension XDeviceType on DeviceType {
  AssetGenImage get icon {
    switch (this) {
      case DeviceType.networkSwitch:
        return Assets.images.networkSwitch;
      case DeviceType.router:
        return Assets.images.router;
      case DeviceType.accessPoint:
        return Assets.images.ap;
      case DeviceType.modem:
        return Assets.images.router;
      case DeviceType.drive:
        return Assets.images.nas;
      case DeviceType.computer:
        return Assets.images.client;
      case DeviceType.printer:
        return Assets.images.printer;
      case DeviceType.server:
        return Assets.images.server;
      case DeviceType.vlan:
        return Assets.images.vlan;
    }
  }
}

@JsonSerializable()
class DeviceModel with EquatableMixin {
  const DeviceModel({
    required this.name,
    required this.available,
    required this.type,
    required this.location,
    this.ip,
    this.mask,
    this.id,
    this.brand,
    this.model,
    this.description,
    this.mac,
    this.parent,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  final String? id;
  final String name;
  final String? brand;
  final String? model;
  final String? description;
  final bool available;
  @DocumentReferenceJsonConverter()
  final DocumentReference? parent;
  final DeviceType type;
  final String? mac;
  final double? ip;
  final double? mask;
  final LocationModel location;

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  DeviceModel copyWith({
    String? id,
    String? name,
    bool? available,
    DeviceType? type,
    double? ip,
    double? mask,
    LocationModel? location,
    String? brand,
    String? model,
    String? description,
    String? mac,
    DocumentReference? parent,
  }) {
    return DeviceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      available: available ?? this.available,
      type: type ?? this.type,
      ip: ip ?? this.ip,
      mask: mask ?? this.mask,
      location: location ?? this.location,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      description: description ?? this.description,
      mac: mac ?? this.mac,
      parent: parent ?? this.parent,
    );
  }

  @override
  List<Object?> get props => [
        name,
        available,
        type,
        ip,
        mask,
        location,
        brand,
        model,
        description,
        mac,
        parent,
      ];
}
