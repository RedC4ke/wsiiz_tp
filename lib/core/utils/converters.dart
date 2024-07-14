import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DocumentReferenceJsonConverter
    implements JsonConverter<DocumentReference?, Object?> {
  const DocumentReferenceJsonConverter();

  @override
  DocumentReference? fromJson(Object? json) {
    if (json != null) {
      return json as DocumentReference;
    }

    return null;
  }

  @override
  Object? toJson(DocumentReference? documentReference) => documentReference;
}
