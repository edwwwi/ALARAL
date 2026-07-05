// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSleepRecordModelCollection on Isar {
  IsarCollection<SleepRecordModel> get sleepRecordModels => this.collection();
}

const SleepRecordModelSchema = CollectionSchema(
  name: r'SleepRecordModel',
  id: -5681159406717572538,
  properties: {
    r'bedTime': PropertySchema(
      id: 0,
      name: r'bedTime',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'durationMinutes': PropertySchema(
      id: 2,
      name: r'durationMinutes',
      type: IsarType.long,
    ),
    r'method': PropertySchema(
      id: 3,
      name: r'method',
      type: IsarType.string,
    ),
    r'quality': PropertySchema(
      id: 4,
      name: r'quality',
      type: IsarType.string,
    ),
    r'sleepDebt': PropertySchema(
      id: 5,
      name: r'sleepDebt',
      type: IsarType.long,
    ),
    r'sleepScore': PropertySchema(
      id: 6,
      name: r'sleepScore',
      type: IsarType.long,
    ),
    r'wakeTime': PropertySchema(
      id: 7,
      name: r'wakeTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sleepRecordModelEstimateSize,
  serialize: _sleepRecordModelSerialize,
  deserialize: _sleepRecordModelDeserialize,
  deserializeProp: _sleepRecordModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'bedTime': IndexSchema(
      id: -593855358998055524,
      name: r'bedTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bedTime',
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
  links: {},
  embeddedSchemas: {},
  getId: _sleepRecordModelGetId,
  getLinks: _sleepRecordModelGetLinks,
  attach: _sleepRecordModelAttach,
  version: '3.1.0+1',
);

int _sleepRecordModelEstimateSize(
  SleepRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.method.length * 3;
  bytesCount += 3 + object.quality.length * 3;
  return bytesCount;
}

void _sleepRecordModelSerialize(
  SleepRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.bedTime);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.durationMinutes);
  writer.writeString(offsets[3], object.method);
  writer.writeString(offsets[4], object.quality);
  writer.writeLong(offsets[5], object.sleepDebt);
  writer.writeLong(offsets[6], object.sleepScore);
  writer.writeDateTime(offsets[7], object.wakeTime);
}

SleepRecordModel _sleepRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SleepRecordModel();
  object.bedTime = reader.readDateTime(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.durationMinutes = reader.readLong(offsets[2]);
  object.id = id;
  object.method = reader.readString(offsets[3]);
  object.quality = reader.readString(offsets[4]);
  object.sleepDebt = reader.readLong(offsets[5]);
  object.sleepScore = reader.readLong(offsets[6]);
  object.wakeTime = reader.readDateTime(offsets[7]);
  return object;
}

P _sleepRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sleepRecordModelGetId(SleepRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sleepRecordModelGetLinks(SleepRecordModel object) {
  return [];
}

void _sleepRecordModelAttach(
    IsarCollection<dynamic> col, Id id, SleepRecordModel object) {
  object.id = id;
}

extension SleepRecordModelQueryWhereSort
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QWhere> {
  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhere> anyBedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bedTime'),
      );
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension SleepRecordModelQueryWhere
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QWhereClause> {
  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      bedTimeEqualTo(DateTime bedTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bedTime',
        value: [bedTime],
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      bedTimeNotEqualTo(DateTime bedTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedTime',
              lower: [],
              upper: [bedTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedTime',
              lower: [bedTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedTime',
              lower: [bedTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedTime',
              lower: [],
              upper: [bedTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      bedTimeGreaterThan(
    DateTime bedTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bedTime',
        lower: [bedTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      bedTimeLessThan(
    DateTime bedTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bedTime',
        lower: [],
        upper: [bedTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      bedTimeBetween(
    DateTime lowerBedTime,
    DateTime upperBedTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bedTime',
        lower: [lowerBedTime],
        includeLower: includeLower,
        upper: [upperBedTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterWhereClause>
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

extension SleepRecordModelQueryFilter
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QFilterCondition> {
  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      bedTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      bedTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      bedTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      bedTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      durationMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      durationMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      durationMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      durationMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'method',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'method',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      methodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'method',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quality',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      qualityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quality',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepDebtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepDebt',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepDebtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepDebt',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepDebtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepDebt',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepDebtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepDebt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      sleepScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      wakeTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      wakeTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      wakeTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterFilterCondition>
      wakeTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wakeTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SleepRecordModelQueryObject
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QFilterCondition> {}

extension SleepRecordModelQueryLinks
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QFilterCondition> {}

extension SleepRecordModelQuerySortBy
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QSortBy> {
  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByBedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedTime', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByBedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedTime', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortBySleepDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDebt', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortBySleepDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDebt', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortBySleepScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByWakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      sortByWakeTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.desc);
    });
  }
}

extension SleepRecordModelQuerySortThenBy
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QSortThenBy> {
  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByBedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedTime', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByBedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedTime', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenBySleepDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDebt', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenBySleepDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDebt', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenBySleepScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.desc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByWakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.asc);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QAfterSortBy>
      thenByWakeTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.desc);
    });
  }
}

extension SleepRecordModelQueryWhereDistinct
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct> {
  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct>
      distinctByBedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bedTime');
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct>
      distinctByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMinutes');
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct> distinctByMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'method', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct> distinctByQuality(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct>
      distinctBySleepDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepDebt');
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct>
      distinctBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepScore');
    });
  }

  QueryBuilder<SleepRecordModel, SleepRecordModel, QDistinct>
      distinctByWakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wakeTime');
    });
  }
}

extension SleepRecordModelQueryProperty
    on QueryBuilder<SleepRecordModel, SleepRecordModel, QQueryProperty> {
  QueryBuilder<SleepRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SleepRecordModel, DateTime, QQueryOperations> bedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bedTime');
    });
  }

  QueryBuilder<SleepRecordModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SleepRecordModel, int, QQueryOperations>
      durationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMinutes');
    });
  }

  QueryBuilder<SleepRecordModel, String, QQueryOperations> methodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'method');
    });
  }

  QueryBuilder<SleepRecordModel, String, QQueryOperations> qualityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quality');
    });
  }

  QueryBuilder<SleepRecordModel, int, QQueryOperations> sleepDebtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepDebt');
    });
  }

  QueryBuilder<SleepRecordModel, int, QQueryOperations> sleepScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepScore');
    });
  }

  QueryBuilder<SleepRecordModel, DateTime, QQueryOperations>
      wakeTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wakeTime');
    });
  }
}
