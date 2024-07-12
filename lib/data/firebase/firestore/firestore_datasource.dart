import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final firestoreDatasourceProvider = Provider((ref) => FirestoreDatasource());

abstract class _Collection {}

class FirestoreDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String get _userId => _auth.currentUser?.uid ?? '';
}
