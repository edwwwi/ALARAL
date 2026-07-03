// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWaterLogCollection on Isar {
  IsarCollection<WaterLog> get waterLogs => this.collection();
}

const WaterLogSchema = CollectionSchema(
  name: r'WaterLog',
  id: -2141755497822994266,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'goalMl': PropertySchema(
      id: 1,
      name: r'goalMl',
      type: IsarType.long,
    ),
    r'logEntries': PropertySchema(
      id: 2,
      name: r'logEntries',
      type: IsarType.longList,
    ),
    r'totalIntakeMl': PropertySchema(
      id: 3,
      name: r'totalIntakeMl',
      type: IsarType.long,
    )
  },
  estimateSize: _waterLogEstimateSize,
  serialize: _waterLogSerialize,
  deserialize: _waterLogDeserialize,
  deserializeProp: _waterLogDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _waterLogGetId,
  getLinks: _waterLogGetLinks,
  attach: _waterLogAttach,
  version: '3.1.0+1',
);

int _waterLogEstimateSize(
  WaterLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.logEntries.length * 8;
  return bytesCount;
}

void _waterLogSerialize(
  WaterLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeLong(offsets[1], object.goalMl);
  writer.writeLongList(offsets[2], object.logEntries);
  writer.writeLong(offsets[3], object.totalIntakeMl);
}

WaterLog _waterLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WaterLog();
  object.date = reader.readDateTime(offsets[0]);
  object.goalMl = reader.readLong(offsets[1]);
  object.id = id;
  object.logEntries = reader.readLongList(offsets[2]) ?? [];
  object.totalIntakeMl = reader.readLong(offsets[3]);
  return object;
}

P _waterLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _waterLogGetId(WaterLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _waterLogGetLinks(WaterLog object) {
  return [];
}

void _waterLogAttach(IsarCollection<dynamic> col, Id id, WaterLog object) {
  object.id = id;
}

extension WaterLogQueryWhereSort on QueryBuilder<WaterLog, WaterLog, QWhere> {
  QueryBuilder<WaterLog, WaterLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension WaterLogQueryWhere on QueryBuilder<WaterLog, WaterLog, QWhereClause> {
  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> idBetween(
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

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
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

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> dateGreaterThan(
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

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> dateLessThan(
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

  QueryBuilder<WaterLog, WaterLog, QAfterWhereClause> dateBetween(
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

extension WaterLogQueryFilter
    on QueryBuilder<WaterLog, WaterLog, QFilterCondition> {
  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> goalMlEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goalMl',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> goalMlGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goalMl',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> goalMlLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goalMl',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> goalMlBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goalMl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logEntries',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logEntries',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logEntries',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logEntries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logEntries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> logEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logEntries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logEntries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logEntries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logEntries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      logEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logEntries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> totalIntakeMlEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalIntakeMl',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition>
      totalIntakeMlGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalIntakeMl',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> totalIntakeMlLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalIntakeMl',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterFilterCondition> totalIntakeMlBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalIntakeMl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WaterLogQueryObject
    on QueryBuilder<WaterLog, WaterLog, QFilterCondition> {}

extension WaterLogQueryLinks
    on QueryBuilder<WaterLog, WaterLog, QFilterCondition> {}

extension WaterLogQuerySortBy on QueryBuilder<WaterLog, WaterLog, QSortBy> {
  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> sortByGoalMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalMl', Sort.asc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> sortByGoalMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalMl', Sort.desc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> sortByTotalIntakeMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIntakeMl', Sort.asc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> sortByTotalIntakeMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIntakeMl', Sort.desc);
    });
  }
}

extension WaterLogQuerySortThenBy
    on QueryBuilder<WaterLog, WaterLog, QSortThenBy> {
  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenByGoalMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalMl', Sort.asc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenByGoalMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalMl', Sort.desc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenByTotalIntakeMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIntakeMl', Sort.asc);
    });
  }

  QueryBuilder<WaterLog, WaterLog, QAfterSortBy> thenByTotalIntakeMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIntakeMl', Sort.desc);
    });
  }
}

extension WaterLogQueryWhereDistinct
    on QueryBuilder<WaterLog, WaterLog, QDistinct> {
  QueryBuilder<WaterLog, WaterLog, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<WaterLog, WaterLog, QDistinct> distinctByGoalMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goalMl');
    });
  }

  QueryBuilder<WaterLog, WaterLog, QDistinct> distinctByLogEntries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logEntries');
    });
  }

  QueryBuilder<WaterLog, WaterLog, QDistinct> distinctByTotalIntakeMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalIntakeMl');
    });
  }
}

extension WaterLogQueryProperty
    on QueryBuilder<WaterLog, WaterLog, QQueryProperty> {
  QueryBuilder<WaterLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WaterLog, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<WaterLog, int, QQueryOperations> goalMlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goalMl');
    });
  }

  QueryBuilder<WaterLog, List<int>, QQueryOperations> logEntriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logEntries');
    });
  }

  QueryBuilder<WaterLog, int, QQueryOperations> totalIntakeMlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalIntakeMl');
    });
  }
}
