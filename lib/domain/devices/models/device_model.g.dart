// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      name: json['name'] as String,
      available: json['available'] as bool,
      type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
      ip: (json['ip'] as num).toInt(),
      mask: (json['mask'] as num).toInt(),
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      id: json['id'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      description: json['description'] as String?,
      mac: json['mac'] as String?,
      parent: const DocumentReferenceJsonConverter().fromJson(json['parent']),
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'model': instance.model,
      'description': instance.description,
      'available': instance.available,
      'parent': const DocumentReferenceJsonConverter().toJson(instance.parent),
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'mac': instance.mac,
      'ip': instance.ip,
      'mask': instance.mask,
      'location': instance.location.toJson(),
    };

const _$DeviceTypeEnumMap = {
  DeviceType.networkSwitch: 'switch',
  DeviceType.router: 'router',
  DeviceType.accessPoint: 'accessPoint',
  DeviceType.modem: 'modem',
  DeviceType.drive: 'drive',
};
