import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wsiiz_tp/core/utils/converters.dart';
import 'package:wsiiz_tp/domain/devices/models/location_model.dart';

part 'device_model.g.dart';

@JsonEnum()
enum DeviceType {
  @JsonValue('switch')
  networkSwitch,
  router,
  accessPoint,
  modem,
  drive,
}

@JsonSerializable()
class DeviceModel with EquatableMixin {
  const DeviceModel({
    required this.name,
    required this.available,
    required this.type,
    required this.ip,
    required this.mask,
    required this.location,
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
  final int ip;
  final int mask;
  final LocationModel location;

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  DeviceModel copyWith({
    String? id,
    String? name,
    bool? available,
    DeviceType? type,
    int? ip,
    int? mask,
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
