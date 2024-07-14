import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wsiiz_tp/domain/devices/models/device_model.dart';

final firestoreDatasourceProvider = Provider((ref) => FirestoreDatasource());

abstract class _Collection {
  static const devices = 'devices';
}

class FirestoreDatasource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<DeviceModel>> getDevices() async {
    final snapshot = await _db.collection(_Collection.devices).get();

    return snapshot.docs
        .map((doc) => DeviceModel.fromJson(doc.data()).copyWith(id: doc.id))
        .toList();
  }
}
