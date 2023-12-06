import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrmClienteRecord extends FirestoreRecord {
  FrmClienteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "edad" field.
  int? _edad;
  int get edad => _edad ?? 0;
  bool hasEdad() => _edad != null;

  // "tipoPiel" field.
  String? _tipoPiel;
  String get tipoPiel => _tipoPiel ?? '';
  bool hasTipoPiel() => _tipoPiel != null;

  // "alergias" field.
  String? _alergias;
  String get alergias => _alergias ?? '';
  bool hasAlergias() => _alergias != null;

  // "colorPiel" field.
  String? _colorPiel;
  String get colorPiel => _colorPiel ?? '';
  bool hasColorPiel() => _colorPiel != null;

  // "alergia" field.
  List<String>? _alergia;
  List<String> get alergia => _alergia ?? const [];
  bool hasAlergia() => _alergia != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _provincia = snapshotData['provincia'] as String?;
    _edad = castToType<int>(snapshotData['edad']);
    _tipoPiel = snapshotData['tipoPiel'] as String?;
    _alergias = snapshotData['alergias'] as String?;
    _colorPiel = snapshotData['colorPiel'] as String?;
    _alergia = getDataList(snapshotData['alergia']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('frmCliente');

  static Stream<FrmClienteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FrmClienteRecord.fromSnapshot(s));

  static Future<FrmClienteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FrmClienteRecord.fromSnapshot(s));

  static FrmClienteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FrmClienteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FrmClienteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FrmClienteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FrmClienteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FrmClienteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFrmClienteRecordData({
  String? nombre,
  String? provincia,
  int? edad,
  String? tipoPiel,
  String? alergias,
  String? colorPiel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'provincia': provincia,
      'edad': edad,
      'tipoPiel': tipoPiel,
      'alergias': alergias,
      'colorPiel': colorPiel,
    }.withoutNulls,
  );

  return firestoreData;
}

class FrmClienteRecordDocumentEquality implements Equality<FrmClienteRecord> {
  const FrmClienteRecordDocumentEquality();

  @override
  bool equals(FrmClienteRecord? e1, FrmClienteRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombre == e2?.nombre &&
        e1?.provincia == e2?.provincia &&
        e1?.edad == e2?.edad &&
        e1?.tipoPiel == e2?.tipoPiel &&
        e1?.alergias == e2?.alergias &&
        e1?.colorPiel == e2?.colorPiel &&
        listEquality.equals(e1?.alergia, e2?.alergia);
  }

  @override
  int hash(FrmClienteRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.provincia,
        e?.edad,
        e?.tipoPiel,
        e?.alergias,
        e?.colorPiel,
        e?.alergia
      ]);

  @override
  bool isValidKey(Object? o) => o is FrmClienteRecord;
}
