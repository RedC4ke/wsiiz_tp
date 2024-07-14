import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel with EquatableMixin {
  const LocationModel({
    required this.longitude,
    required this.latitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  final double longitude;
  final double latitude;

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  List<Object?> get props => [longitude, latitude];
}
