// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_summary_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailySummaryModelCollection on Isar {
  IsarCollection<DailySummaryModel> get dailySummaryModels => this.collection();
}

const DailySummaryModelSchema = CollectionSchema(
  name: r'DailySummaryModel',
  id: -794567742946120472,
  properties: {
    r'alarmSuccess': PropertySchema(
      id: 0,
      name: r'alarmSuccess',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'overallScore': PropertySchema(
      id: 2,
      name: r'overallScore',
      type: IsarType.long,
    ),
    r'remindersCompleted': PropertySchema(
      id: 3,
      name: r'remindersCompleted',
      type: IsarType.long,
    ),
    r'sleepMinutes': PropertySchema(
      id: 4,
      name: r'sleepMinutes',
      type: IsarType.long,
    ),
    r'waterMl': PropertySchema(
      id: 5,
      name: r'waterMl',
      type: IsarType.long,
    )
  },
  estimateSize: _dailySummaryModelEstimateSize,
  serialize: _dailySummaryModelSerialize,
  deserialize: _dailySummaryModelDeserialize,
  deserializeProp: _dailySummaryModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'sleepRecords': LinkSchema(
      id: -5692812074057007644,
      name: r'sleepRecords',
      target: r'SleepRecordModel',
      single: false,
    ),
    r'waterEntries': LinkSchema(
      id: -7552870244982779254,
      name: r'waterEntries',
      target: r'WaterEntryModel',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _dailySummaryModelGetId,
  getLinks: _dailySummaryModelGetLinks,
  attach: _dailySummaryModelAttach,
  version: '3.1.0+1',
);

int _dailySummaryModelEstimateSize(
  DailySummaryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dailySummaryModelSerialize(
  DailySummaryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.alarmSuccess);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeLong(offsets[2], object.overallScore);
  writer.writeLong(offsets[3], object.remindersCompleted);
  writer.writeLong(offsets[4], object.sleepMinutes);
  writer.writeLong(offsets[5], object.waterMl);
}

DailySummaryModel _dailySummaryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailySummaryModel();
  object.alarmSuccess = reader.readLong(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  object.overallScore = reader.readLong(offsets[2]);
  object.remindersCompleted = reader.readLong(offsets[3]);
  object.sleepMinutes = reader.readLong(offsets[4]);
  object.waterMl = reader.readLong(offsets[5]);
  return object;
}

P _dailySummaryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailySummaryModelGetId(DailySummaryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailySummaryModelGetLinks(
    DailySummaryModel object) {
  return [object.sleepRecords, object.waterEntries];
}

void _dailySummaryModelAttach(
    IsarCollection<dynamic> col, Id id, DailySummaryModel object) {
  object.id = id;
  object.sleepRecords.attach(
      col, col.isar.collection<SleepRecordModel>(), r'sleepRecords', id);
  object.waterEntries
      .attach(col, col.isar.collection<WaterEntryModel>(), r'waterEntries', id);
}

extension DailySummaryModelByIndex on IsarCollection<DailySummaryModel> {
  Future<DailySummaryModel?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  DailySummaryModel? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<DailySummaryModel?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<DailySummaryModel?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(DailySummaryModel object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(DailySummaryModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<DailySummaryModel> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<DailySummaryModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension DailySummaryModelQueryWhereSort
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QWhere> {
  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension DailySummaryModelQueryWhere
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QWhereClause> {
  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
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

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
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

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      dateEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterWhereClause>
      dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailySummaryModelQueryFilter
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QFilterCondition> {
  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      alarmSuccessEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alarmSuccess',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      alarmSuccessGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alarmSuccess',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      alarmSuccessLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alarmSuccess',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      alarmSuccessBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alarmSuccess',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
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

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
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

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
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

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      overallScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallScore',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      overallScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallScore',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      overallScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallScore',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      overallScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      remindersCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remindersCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      remindersCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remindersCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      remindersCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remindersCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      remindersCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remindersCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterMlEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterMl',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterMlGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterMl',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterMlLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterMl',
        value: value,
      ));
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterMlBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterMl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailySummaryModelQueryObject
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QFilterCondition> {}

extension DailySummaryModelQueryLinks
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QFilterCondition> {
  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepRecords(FilterQuery<SleepRecordModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sleepRecords');
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepRecordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sleepRecords', length, true, length, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepRecordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sleepRecords', 0, true, 0, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepRecordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sleepRecords', 0, false, 999999, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepRecordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sleepRecords', 0, true, length, include);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepRecordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sleepRecords', length, include, 999999, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      sleepRecordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'sleepRecords', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterEntries(FilterQuery<WaterEntryModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'waterEntries');
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'waterEntries', length, true, length, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'waterEntries', 0, true, 0, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'waterEntries', 0, false, 999999, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterEntriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'waterEntries', 0, true, length, include);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterEntriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'waterEntries', length, include, 999999, true);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterFilterCondition>
      waterEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'waterEntries', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DailySummaryModelQuerySortBy
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QSortBy> {
  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByAlarmSuccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alarmSuccess', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByAlarmSuccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alarmSuccess', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByRemindersCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersCompleted', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByRemindersCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersCompleted', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortBySleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortBySleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByWaterMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterMl', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      sortByWaterMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterMl', Sort.desc);
    });
  }
}

extension DailySummaryModelQuerySortThenBy
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QSortThenBy> {
  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByAlarmSuccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alarmSuccess', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByAlarmSuccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alarmSuccess', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByRemindersCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersCompleted', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByRemindersCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersCompleted', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenBySleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenBySleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByWaterMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterMl', Sort.asc);
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QAfterSortBy>
      thenByWaterMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterMl', Sort.desc);
    });
  }
}

extension DailySummaryModelQueryWhereDistinct
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QDistinct> {
  QueryBuilder<DailySummaryModel, DailySummaryModel, QDistinct>
      distinctByAlarmSuccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alarmSuccess');
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QDistinct>
      distinctByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallScore');
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QDistinct>
      distinctByRemindersCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remindersCompleted');
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QDistinct>
      distinctBySleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepMinutes');
    });
  }

  QueryBuilder<DailySummaryModel, DailySummaryModel, QDistinct>
      distinctByWaterMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterMl');
    });
  }
}

extension DailySummaryModelQueryProperty
    on QueryBuilder<DailySummaryModel, DailySummaryModel, QQueryProperty> {
  QueryBuilder<DailySummaryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailySummaryModel, int, QQueryOperations>
      alarmSuccessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alarmSuccess');
    });
  }

  QueryBuilder<DailySummaryModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DailySummaryModel, int, QQueryOperations>
      overallScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallScore');
    });
  }

  QueryBuilder<DailySummaryModel, int, QQueryOperations>
      remindersCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remindersCompleted');
    });
  }

  QueryBuilder<DailySummaryModel, int, QQueryOperations>
      sleepMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepMinutes');
    });
  }

  QueryBuilder<DailySummaryModel, int, QQueryOperations> waterMlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterMl');
    });
  }
}
