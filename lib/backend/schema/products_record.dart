import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "product_price" field.
  int? _productPrice;
  int get productPrice => _productPrice ?? 0;
  bool hasProductPrice() => _productPrice != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "product_photo" field.
  String? _productPhoto;
  String get productPhoto => _productPhoto ?? '';
  bool hasProductPhoto() => _productPhoto != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _productName = snapshotData['product_name'] as String?;
    _productPrice = castToType<int>(snapshotData['product_price']);
    _description = snapshotData['description'] as String?;
    _productPhoto = snapshotData['product_photo'] as String?;
    _brand = snapshotData['brand'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? productName,
  int? productPrice,
  String? description,
  String? productPhoto,
  String? brand,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_name': productName,
      'product_price': productPrice,
      'description': description,
      'product_photo': productPhoto,
      'brand': brand,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.productName == e2?.productName &&
        e1?.productPrice == e2?.productPrice &&
        e1?.description == e2?.description &&
        e1?.productPhoto == e2?.productPhoto &&
        e1?.brand == e2?.brand &&
        e1?.category == e2?.category;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.productPrice,
        e?.description,
        e?.productPhoto,
        e?.brand,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
