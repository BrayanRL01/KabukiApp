// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IsAdminStruct extends FFFirebaseStruct {
  IsAdminStruct({
    bool? admin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _admin = admin,
        super(firestoreUtilData);

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  set admin(bool? val) => _admin = val;
  bool hasAdmin() => _admin != null;

  static IsAdminStruct fromMap(Map<String, dynamic> data) => IsAdminStruct(
        admin: data['admin'] as bool?,
      );

  static IsAdminStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? IsAdminStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'admin': _admin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'admin': serializeParam(
          _admin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static IsAdminStruct fromSerializableMap(Map<String, dynamic> data) =>
      IsAdminStruct(
        admin: deserializeParam(
          data['admin'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'IsAdminStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IsAdminStruct && admin == other.admin;
  }

  @override
  int get hashCode => const ListEquality().hash([admin]);
}

IsAdminStruct createIsAdminStruct({
  bool? admin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IsAdminStruct(
      admin: admin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IsAdminStruct? updateIsAdminStruct(
  IsAdminStruct? isAdmin, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    isAdmin
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIsAdminStructData(
  Map<String, dynamic> firestoreData,
  IsAdminStruct? isAdmin,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (isAdmin == null) {
    return;
  }
  if (isAdmin.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && isAdmin.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final isAdminData = getIsAdminFirestoreData(isAdmin, forFieldValue);
  final nestedData = isAdminData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = isAdmin.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIsAdminFirestoreData(
  IsAdminStruct? isAdmin, [
  bool forFieldValue = false,
]) {
  if (isAdmin == null) {
    return {};
  }
  final firestoreData = mapToFirestore(isAdmin.toMap());

  // Add any Firestore field values
  isAdmin.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIsAdminListFirestoreData(
  List<IsAdminStruct>? isAdmins,
) =>
    isAdmins?.map((e) => getIsAdminFirestoreData(e, true)).toList() ?? [];
