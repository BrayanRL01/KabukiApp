import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllergiesRecord extends FirestoreRecord {
  AllergiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "allergy_name" field.
  String? _allergyName;
  String get allergyName => _allergyName ?? '';
  bool hasAllergyName() => _allergyName != null;

  void _initializeFields() {
    _allergyName = snapshotData['allergy_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Allergies');

  static Stream<AllergiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllergiesRecord.fromSnapshot(s));

  static Future<AllergiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllergiesRecord.fromSnapshot(s));

  static AllergiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllergiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllergiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllergiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllergiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllergiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllergiesRecordData({
  String? allergyName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'allergy_name': allergyName,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllergiesRecordDocumentEquality implements Equality<AllergiesRecord> {
  const AllergiesRecordDocumentEquality();

  @override
  bool equals(AllergiesRecord? e1, AllergiesRecord? e2) {
    return e1?.allergyName == e2?.allergyName;
  }

  @override
  int hash(AllergiesRecord? e) => const ListEquality().hash([e?.allergyName]);

  @override
  bool isValidKey(Object? o) => o is AllergiesRecord;
}
