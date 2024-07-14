import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wsiiz_tp/data/firebase/firestore/firestore_datasource.dart';
import 'package:wsiiz_tp/domain/devices/models/device_model.dart';
import 'package:wsiiz_tp/domain/error/catch_error.dart';
import 'package:wsiiz_tp/domain/error/models/failure.dart';

final devicesRepositoryProvider = Provider(
  (ref) => DevicesRepository(
    ref.read(firestoreDatasourceProvider),
  ),
);

class DevicesRepository {
  DevicesRepository(
    this._firestore,
  );

  final FirestoreDatasource _firestore;

  TaskEither<Failure, List<DeviceModel>> getDevices() {
    return catchError(_firestore.getDevices);
  }
}
