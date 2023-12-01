import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentStatusRecord extends FirestoreRecord {
  AppointmentStatusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AppointmentStatus');

  static Stream<AppointmentStatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentStatusRecord.fromSnapshot(s));

  static Future<AppointmentStatusRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppointmentStatusRecord.fromSnapshot(s));

  static AppointmentStatusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentStatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentStatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentStatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentStatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentStatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentStatusRecordData({
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentStatusRecordDocumentEquality
    implements Equality<AppointmentStatusRecord> {
  const AppointmentStatusRecordDocumentEquality();

  @override
  bool equals(AppointmentStatusRecord? e1, AppointmentStatusRecord? e2) {
    return e1?.status == e2?.status;
  }

  @override
  int hash(AppointmentStatusRecord? e) =>
      const ListEquality().hash([e?.status]);

  @override
  bool isValidKey(Object? o) => o is AppointmentStatusRecord;
}
