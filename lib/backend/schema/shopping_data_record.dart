import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShoppingDataRecord extends FirestoreRecord {
  ShoppingDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "SubTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "UserId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "Products" field.
  DocumentReference? _products;
  DocumentReference? get products => _products;
  bool hasProducts() => _products != null;

  void _initializeFields() {
    _quantity = castToType<int>(snapshotData['Quantity']);
    _subTotal = castToType<double>(snapshotData['SubTotal']);
    _userId = snapshotData['UserId'] as DocumentReference?;
    _products = snapshotData['Products'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShoppingData');

  static Stream<ShoppingDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShoppingDataRecord.fromSnapshot(s));

  static Future<ShoppingDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShoppingDataRecord.fromSnapshot(s));

  static ShoppingDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShoppingDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShoppingDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShoppingDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShoppingDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShoppingDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShoppingDataRecordData({
  int? quantity,
  double? subTotal,
  DocumentReference? userId,
  DocumentReference? products,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Quantity': quantity,
      'SubTotal': subTotal,
      'UserId': userId,
      'Products': products,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShoppingDataRecordDocumentEquality
    implements Equality<ShoppingDataRecord> {
  const ShoppingDataRecordDocumentEquality();

  @override
  bool equals(ShoppingDataRecord? e1, ShoppingDataRecord? e2) {
    return e1?.quantity == e2?.quantity &&
        e1?.subTotal == e2?.subTotal &&
        e1?.userId == e2?.userId &&
        e1?.products == e2?.products;
  }

  @override
  int hash(ShoppingDataRecord? e) => const ListEquality()
      .hash([e?.quantity, e?.subTotal, e?.userId, e?.products]);

  @override
  bool isValidKey(Object? o) => o is ShoppingDataRecord;
}
