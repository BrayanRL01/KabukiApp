import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_name" field.
  String? _videoName;
  String get videoName => _videoName ?? '';
  bool hasVideoName() => _videoName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "video_path" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  void _initializeFields() {
    _videoName = snapshotData['video_name'] as String?;
    _description = snapshotData['description'] as String?;
    _videoPath = snapshotData['video_path'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  String? videoName,
  String? description,
  String? videoPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_name': videoName,
      'description': description,
      'video_path': videoPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.videoName == e2?.videoName &&
        e1?.description == e2?.description &&
        e1?.videoPath == e2?.videoPath;
  }

  @override
  int hash(VideosRecord? e) =>
      const ListEquality().hash([e?.videoName, e?.description, e?.videoPath]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
