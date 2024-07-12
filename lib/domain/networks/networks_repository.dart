import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wsiiz_tp/data/firebase/firestore/firestore_datasource.dart';

final networksRepositoryProvider = Provider<NetworksRepository>((ref) {
  return NetworksRepository(
    ref.watch(firestoreDatasourceProvider),
  );
});

class NetworksRepository {
  NetworksRepository(
    this._firestore,
  );

  final FirestoreDatasource _firestore;
}
