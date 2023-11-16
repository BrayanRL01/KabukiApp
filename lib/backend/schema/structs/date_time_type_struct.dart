// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateTimeTypeStruct extends FFFirebaseStruct {
  DateTimeTypeStruct({
    DateTime? startTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startTime = startTime,
        super(firestoreUtilData);

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  static DateTimeTypeStruct fromMap(Map<String, dynamic> data) =>
      DateTimeTypeStruct(
        startTime: data['start_time'] as DateTime?,
      );

  static DateTimeTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? DateTimeTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'start_time': _startTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'start_time': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DateTimeTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateTimeTypeStruct(
        startTime: deserializeParam(
          data['start_time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DateTimeTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DateTimeTypeStruct && startTime == other.startTime;
  }

  @override
  int get hashCode => const ListEquality().hash([startTime]);
}

DateTimeTypeStruct createDateTimeTypeStruct({
  DateTime? startTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DateTimeTypeStruct(
      startTime: startTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DateTimeTypeStruct? updateDateTimeTypeStruct(
  DateTimeTypeStruct? dateTimeType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dateTimeType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDateTimeTypeStructData(
  Map<String, dynamic> firestoreData,
  DateTimeTypeStruct? dateTimeType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dateTimeType == null) {
    return;
  }
  if (dateTimeType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dateTimeType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dateTimeTypeData =
      getDateTimeTypeFirestoreData(dateTimeType, forFieldValue);
  final nestedData =
      dateTimeTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dateTimeType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDateTimeTypeFirestoreData(
  DateTimeTypeStruct? dateTimeType, [
  bool forFieldValue = false,
]) {
  if (dateTimeType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dateTimeType.toMap());

  // Add any Firestore field values
  dateTimeType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDateTimeTypeListFirestoreData(
  List<DateTimeTypeStruct>? dateTimeTypes,
) =>
    dateTimeTypes?.map((e) => getDateTimeTypeFirestoreData(e, true)).toList() ??
    [];
