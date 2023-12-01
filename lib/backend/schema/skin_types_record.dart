import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkinTypesRecord extends FirestoreRecord {
  SkinTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "skin_type" field.
  String? _skinType;
  String get skinType => _skinType ?? '';
  bool hasSkinType() => _skinType != null;

  void _initializeFields() {
    _skinType = snapshotData['skin_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SkinTypes');

  static Stream<SkinTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SkinTypesRecord.fromSnapshot(s));

  static Future<SkinTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SkinTypesRecord.fromSnapshot(s));

  static SkinTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SkinTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SkinTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SkinTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SkinTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SkinTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSkinTypesRecordData({
  String? skinType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'skin_type': skinType,
    }.withoutNulls,
  );

  return firestoreData;
}

class SkinTypesRecordDocumentEquality implements Equality<SkinTypesRecord> {
  const SkinTypesRecordDocumentEquality();

  @override
  bool equals(SkinTypesRecord? e1, SkinTypesRecord? e2) {
    return e1?.skinType == e2?.skinType;
  }

  @override
  int hash(SkinTypesRecord? e) => const ListEquality().hash([e?.skinType]);

  @override
  bool isValidKey(Object? o) => o is SkinTypesRecord;
}
