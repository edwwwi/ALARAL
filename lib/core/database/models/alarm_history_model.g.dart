// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_history_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlarmHistoryModelCollection on Isar {
  IsarCollection<AlarmHistoryModel> get alarmHistoryModels => this.collection();
}

const AlarmHistoryModelSchema = CollectionSchema(
  name: r'AlarmHistoryModel',
  id: 8085899903883556251,
  properties: {
    r'actualDismissTime': PropertySchema(
      id: 0,
      name: r'actualDismissTime',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dismissType': PropertySchema(
      id: 2,
      name: r'dismissType',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 3,
      name: r'notes',
      type: IsarType.string,
    ),
    r'scheduledTime': PropertySchema(
      id: 4,
      name: r'scheduledTime',
      type: IsarType.dateTime,
    ),
    r'snoozeCount': PropertySchema(
      id: 5,
      name: r'snoozeCount',
      type: IsarType.long,
    )
  },
  estimateSize: _alarmHistoryModelEstimateSize,
  serialize: _alarmHistoryModelSerialize,
  deserialize: _alarmHistoryModelDeserialize,
  deserializeProp: _alarmHistoryModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'scheduledTime': IndexSchema(
      id: 4528483578431344364,
      name: r'scheduledTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scheduledTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'alarm': LinkSchema(
      id: -1435415179098831097,
      name: r'alarm',
      target: r'AlarmModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _alarmHistoryModelGetId,
  getLinks: _alarmHistoryModelGetLinks,
  attach: _alarmHistoryModelAttach,
  version: '3.1.0+1',
);

int _alarmHistoryModelEstimateSize(
  AlarmHistoryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dismissType.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  return bytesCount;
}

void _alarmHistoryModelSerialize(
  AlarmHistoryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualDismissTime);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.dismissType);
  writer.writeString(offsets[3], object.notes);
  writer.writeDateTime(offsets[4], object.scheduledTime);
  writer.writeLong(offsets[5], object.snoozeCount);
}

AlarmHistoryModel _alarmHistoryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlarmHistoryModel();
  object.actualDismissTime = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dismissType = reader.readString(offsets[2]);
  object.id = id;
  object.notes = reader.readString(offsets[3]);
  object.scheduledTime = reader.readDateTime(offsets[4]);
  object.snoozeCount = reader.readLong(offsets[5]);
  return object;
}

P _alarmHistoryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _alarmHistoryModelGetId(AlarmHistoryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _alarmHistoryModelGetLinks(
    AlarmHistoryModel object) {
  return [object.alarm];
}

void _alarmHistoryModelAttach(
    IsarCollection<dynamic> col, Id id, AlarmHistoryModel object) {
  object.id = id;
  object.alarm.attach(col, col.isar.collection<AlarmModel>(), r'alarm', id);
}

extension AlarmHistoryModelQueryWhereSort
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QWhere> {
  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhere>
      anyScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'scheduledTime'),
      );
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension AlarmHistoryModelQueryWhere
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QWhereClause> {
  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      scheduledTimeEqualTo(DateTime scheduledTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'scheduledTime',
        value: [scheduledTime],
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      scheduledTimeNotEqualTo(DateTime scheduledTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [],
              upper: [scheduledTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [scheduledTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [scheduledTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [],
              upper: [scheduledTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      scheduledTimeGreaterThan(
    DateTime scheduledTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledTime',
        lower: [scheduledTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      scheduledTimeLessThan(
    DateTime scheduledTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledTime',
        lower: [],
        upper: [scheduledTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      scheduledTimeBetween(
    DateTime lowerScheduledTime,
    DateTime upperScheduledTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledTime',
        lower: [lowerScheduledTime],
        includeLower: includeLower,
        upper: [upperScheduledTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AlarmHistoryModelQueryFilter
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QFilterCondition> {
  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      actualDismissTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualDismissTime',
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      actualDismissTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualDismissTime',
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      actualDismissTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualDismissTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      actualDismissTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualDismissTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      actualDismissTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualDismissTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      actualDismissTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualDismissTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dismissType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dismissType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dismissType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dismissType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dismissType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dismissType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dismissType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dismissType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dismissType',
        value: '',
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      dismissTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dismissType',
        value: '',
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      scheduledTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      scheduledTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      scheduledTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      scheduledTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      snoozeCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snoozeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      snoozeCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snoozeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      snoozeCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snoozeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      snoozeCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snoozeCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AlarmHistoryModelQueryObject
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QFilterCondition> {}

extension AlarmHistoryModelQueryLinks
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QFilterCondition> {
  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      alarm(FilterQuery<AlarmModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'alarm');
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterFilterCondition>
      alarmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alarm', 0, true, 0, true);
    });
  }
}

extension AlarmHistoryModelQuerySortBy
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QSortBy> {
  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByActualDismissTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDismissTime', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByActualDismissTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDismissTime', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByDismissType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissType', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByDismissTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissType', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortByScheduledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortBySnoozeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoozeCount', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      sortBySnoozeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoozeCount', Sort.desc);
    });
  }
}

extension AlarmHistoryModelQuerySortThenBy
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QSortThenBy> {
  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByActualDismissTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDismissTime', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByActualDismissTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDismissTime', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByDismissType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissType', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByDismissTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissType', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenByScheduledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenBySnoozeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoozeCount', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QAfterSortBy>
      thenBySnoozeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoozeCount', Sort.desc);
    });
  }
}

extension AlarmHistoryModelQueryWhereDistinct
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QDistinct> {
  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QDistinct>
      distinctByActualDismissTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualDismissTime');
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QDistinct>
      distinctByDismissType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dismissType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QDistinct>
      distinctByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledTime');
    });
  }

  QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QDistinct>
      distinctBySnoozeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snoozeCount');
    });
  }
}

extension AlarmHistoryModelQueryProperty
    on QueryBuilder<AlarmHistoryModel, AlarmHistoryModel, QQueryProperty> {
  QueryBuilder<AlarmHistoryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AlarmHistoryModel, DateTime?, QQueryOperations>
      actualDismissTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualDismissTime');
    });
  }

  QueryBuilder<AlarmHistoryModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AlarmHistoryModel, String, QQueryOperations>
      dismissTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dismissType');
    });
  }

  QueryBuilder<AlarmHistoryModel, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<AlarmHistoryModel, DateTime, QQueryOperations>
      scheduledTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledTime');
    });
  }

  QueryBuilder<AlarmHistoryModel, int, QQueryOperations> snoozeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snoozeCount');
    });
  }
}
