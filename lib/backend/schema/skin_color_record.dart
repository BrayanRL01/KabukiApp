import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkinColorRecord extends FirestoreRecord {
  SkinColorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "skin_color" field.
  String? _skinColor;
  String get skinColor => _skinColor ?? '';
  bool hasSkinColor() => _skinColor != null;

  void _initializeFields() {
    _skinColor = snapshotData['skin_color'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SkinColor');

  static Stream<SkinColorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SkinColorRecord.fromSnapshot(s));

  static Future<SkinColorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SkinColorRecord.fromSnapshot(s));

  static SkinColorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SkinColorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SkinColorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SkinColorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SkinColorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SkinColorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSkinColorRecordData({
  String? skinColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'skin_color': skinColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class SkinColorRecordDocumentEquality implements Equality<SkinColorRecord> {
  const SkinColorRecordDocumentEquality();

  @override
  bool equals(SkinColorRecord? e1, SkinColorRecord? e2) {
    return e1?.skinColor == e2?.skinColor;
  }

  @override
  int hash(SkinColorRecord? e) => const ListEquality().hash([e?.skinColor]);

  @override
  bool isValidKey(Object? o) => o is SkinColorRecord;
}
