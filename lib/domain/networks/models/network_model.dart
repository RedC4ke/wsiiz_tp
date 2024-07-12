import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wsiiz_tp/domain/firestore/models/firestore_model.dart';

part 'network_model.freezed.dart';

@JsonSerializable()
class NetworkModel extends FirestoreModel with EquatableMixin {
  final String name;
  final int address;
  final int mask;
  final int gateway;
}
