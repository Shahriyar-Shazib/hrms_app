// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CachedHousesTable extends CachedHouses
    with TableInfo<$CachedHousesTable, CachedHouse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedHousesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalFloorsMeta = const VerificationMeta(
    'totalFloors',
  );
  @override
  late final GeneratedColumn<int> totalFloors = GeneratedColumn<int>(
    'total_floors',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerId,
    name,
    address,
    city,
    totalFloors,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_houses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedHouse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('total_floors')) {
      context.handle(
        _totalFloorsMeta,
        totalFloors.isAcceptableOrUnknown(
          data['total_floors']!,
          _totalFloorsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedHouse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedHouse(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      totalFloors: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_floors'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedHousesTable createAlias(String alias) {
    return $CachedHousesTable(attachedDatabase, alias);
  }
}

class CachedHouse extends DataClass implements Insertable<CachedHouse> {
  final String id;
  final String ownerId;
  final String name;
  final String? address;
  final String? city;
  final int? totalFloors;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  const CachedHouse({
    required this.id,
    required this.ownerId,
    required this.name,
    this.address,
    this.city,
    this.totalFloors,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_id'] = Variable<String>(ownerId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || totalFloors != null) {
      map['total_floors'] = Variable<int>(totalFloors);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  CachedHousesCompanion toCompanion(bool nullToAbsent) {
    return CachedHousesCompanion(
      id: Value(id),
      ownerId: Value(ownerId),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      totalFloors: totalFloors == null && nullToAbsent
          ? const Value.absent()
          : Value(totalFloors),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedHouse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedHouse(
      id: serializer.fromJson<String>(json['id']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      city: serializer.fromJson<String?>(json['city']),
      totalFloors: serializer.fromJson<int?>(json['totalFloors']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerId': serializer.toJson<String>(ownerId),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'city': serializer.toJson<String?>(city),
      'totalFloors': serializer.toJson<int?>(totalFloors),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  CachedHouse copyWith({
    String? id,
    String? ownerId,
    String? name,
    Value<String?> address = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<int?> totalFloors = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? createdAt,
    String? updatedAt,
  }) => CachedHouse(
    id: id ?? this.id,
    ownerId: ownerId ?? this.ownerId,
    name: name ?? this.name,
    address: address.present ? address.value : this.address,
    city: city.present ? city.value : this.city,
    totalFloors: totalFloors.present ? totalFloors.value : this.totalFloors,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedHouse copyWithCompanion(CachedHousesCompanion data) {
    return CachedHouse(
      id: data.id.present ? data.id.value : this.id,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      totalFloors: data.totalFloors.present
          ? data.totalFloors.value
          : this.totalFloors,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedHouse(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('totalFloors: $totalFloors, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerId,
    name,
    address,
    city,
    totalFloors,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedHouse &&
          other.id == this.id &&
          other.ownerId == this.ownerId &&
          other.name == this.name &&
          other.address == this.address &&
          other.city == this.city &&
          other.totalFloors == this.totalFloors &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CachedHousesCompanion extends UpdateCompanion<CachedHouse> {
  final Value<String> id;
  final Value<String> ownerId;
  final Value<String> name;
  final Value<String?> address;
  final Value<String?> city;
  final Value<int?> totalFloors;
  final Value<String?> notes;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const CachedHousesCompanion({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.totalFloors = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedHousesCompanion.insert({
    required String id,
    required String ownerId,
    required String name,
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.totalFloors = const Value.absent(),
    this.notes = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerId = Value(ownerId),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CachedHouse> custom({
    Expression<String>? id,
    Expression<String>? ownerId,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? city,
    Expression<int>? totalFloors,
    Expression<String>? notes,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerId != null) 'owner_id': ownerId,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (totalFloors != null) 'total_floors': totalFloors,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedHousesCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerId,
    Value<String>? name,
    Value<String?>? address,
    Value<String?>? city,
    Value<int?>? totalFloors,
    Value<String?>? notes,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedHousesCompanion(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      totalFloors: totalFloors ?? this.totalFloors,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (totalFloors.present) {
      map['total_floors'] = Variable<int>(totalFloors.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedHousesCompanion(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('totalFloors: $totalFloors, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedRoomsTable extends CachedRooms
    with TableInfo<$CachedRoomsTable, CachedRoom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedRoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _houseIdMeta = const VerificationMeta(
    'houseId',
  );
  @override
  late final GeneratedColumn<String> houseId = GeneratedColumn<String>(
    'house_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomNumberMeta = const VerificationMeta(
    'roomNumber',
  );
  @override
  late final GeneratedColumn<String> roomNumber = GeneratedColumn<String>(
    'room_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _floorMeta = const VerificationMeta('floor');
  @override
  late final GeneratedColumn<int> floor = GeneratedColumn<int>(
    'floor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _baseRentMeta = const VerificationMeta(
    'baseRent',
  );
  @override
  late final GeneratedColumn<String> baseRent = GeneratedColumn<String>(
    'base_rent',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meterAttachedMeta = const VerificationMeta(
    'meterAttached',
  );
  @override
  late final GeneratedColumn<bool> meterAttached = GeneratedColumn<bool>(
    'meter_attached',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("meter_attached" IN (0, 1))',
    ),
  );
  static const VerificationMeta _meterNumberMeta = const VerificationMeta(
    'meterNumber',
  );
  @override
  late final GeneratedColumn<String> meterNumber = GeneratedColumn<String>(
    'meter_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentRenterJsonMeta = const VerificationMeta(
    'currentRenterJson',
  );
  @override
  late final GeneratedColumn<String> currentRenterJson =
      GeneratedColumn<String>(
        'current_renter_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseId,
    roomNumber,
    floor,
    baseRent,
    meterAttached,
    meterNumber,
    status,
    notes,
    createdAt,
    updatedAt,
    currentRenterJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_rooms';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedRoom> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('house_id')) {
      context.handle(
        _houseIdMeta,
        houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('room_number')) {
      context.handle(
        _roomNumberMeta,
        roomNumber.isAcceptableOrUnknown(data['room_number']!, _roomNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_roomNumberMeta);
    }
    if (data.containsKey('floor')) {
      context.handle(
        _floorMeta,
        floor.isAcceptableOrUnknown(data['floor']!, _floorMeta),
      );
    }
    if (data.containsKey('base_rent')) {
      context.handle(
        _baseRentMeta,
        baseRent.isAcceptableOrUnknown(data['base_rent']!, _baseRentMeta),
      );
    } else if (isInserting) {
      context.missing(_baseRentMeta);
    }
    if (data.containsKey('meter_attached')) {
      context.handle(
        _meterAttachedMeta,
        meterAttached.isAcceptableOrUnknown(
          data['meter_attached']!,
          _meterAttachedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_meterAttachedMeta);
    }
    if (data.containsKey('meter_number')) {
      context.handle(
        _meterNumberMeta,
        meterNumber.isAcceptableOrUnknown(
          data['meter_number']!,
          _meterNumberMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('current_renter_json')) {
      context.handle(
        _currentRenterJsonMeta,
        currentRenterJson.isAcceptableOrUnknown(
          data['current_renter_json']!,
          _currentRenterJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedRoom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedRoom(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      houseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_id'],
      )!,
      roomNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_number'],
      )!,
      floor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}floor'],
      ),
      baseRent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_rent'],
      )!,
      meterAttached: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}meter_attached'],
      )!,
      meterNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meter_number'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
      currentRenterJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_renter_json'],
      ),
    );
  }

  @override
  $CachedRoomsTable createAlias(String alias) {
    return $CachedRoomsTable(attachedDatabase, alias);
  }
}

class CachedRoom extends DataClass implements Insertable<CachedRoom> {
  final String id;
  final String houseId;
  final String roomNumber;
  final int? floor;
  final String baseRent;
  final bool meterAttached;
  final String? meterNumber;
  final String status;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final String? currentRenterJson;
  const CachedRoom({
    required this.id,
    required this.houseId,
    required this.roomNumber,
    this.floor,
    required this.baseRent,
    required this.meterAttached,
    this.meterNumber,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.currentRenterJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['house_id'] = Variable<String>(houseId);
    map['room_number'] = Variable<String>(roomNumber);
    if (!nullToAbsent || floor != null) {
      map['floor'] = Variable<int>(floor);
    }
    map['base_rent'] = Variable<String>(baseRent);
    map['meter_attached'] = Variable<bool>(meterAttached);
    if (!nullToAbsent || meterNumber != null) {
      map['meter_number'] = Variable<String>(meterNumber);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    if (!nullToAbsent || currentRenterJson != null) {
      map['current_renter_json'] = Variable<String>(currentRenterJson);
    }
    return map;
  }

  CachedRoomsCompanion toCompanion(bool nullToAbsent) {
    return CachedRoomsCompanion(
      id: Value(id),
      houseId: Value(houseId),
      roomNumber: Value(roomNumber),
      floor: floor == null && nullToAbsent
          ? const Value.absent()
          : Value(floor),
      baseRent: Value(baseRent),
      meterAttached: Value(meterAttached),
      meterNumber: meterNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(meterNumber),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      currentRenterJson: currentRenterJson == null && nullToAbsent
          ? const Value.absent()
          : Value(currentRenterJson),
    );
  }

  factory CachedRoom.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedRoom(
      id: serializer.fromJson<String>(json['id']),
      houseId: serializer.fromJson<String>(json['houseId']),
      roomNumber: serializer.fromJson<String>(json['roomNumber']),
      floor: serializer.fromJson<int?>(json['floor']),
      baseRent: serializer.fromJson<String>(json['baseRent']),
      meterAttached: serializer.fromJson<bool>(json['meterAttached']),
      meterNumber: serializer.fromJson<String?>(json['meterNumber']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      currentRenterJson: serializer.fromJson<String?>(
        json['currentRenterJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'houseId': serializer.toJson<String>(houseId),
      'roomNumber': serializer.toJson<String>(roomNumber),
      'floor': serializer.toJson<int?>(floor),
      'baseRent': serializer.toJson<String>(baseRent),
      'meterAttached': serializer.toJson<bool>(meterAttached),
      'meterNumber': serializer.toJson<String?>(meterNumber),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'currentRenterJson': serializer.toJson<String?>(currentRenterJson),
    };
  }

  CachedRoom copyWith({
    String? id,
    String? houseId,
    String? roomNumber,
    Value<int?> floor = const Value.absent(),
    String? baseRent,
    bool? meterAttached,
    Value<String?> meterNumber = const Value.absent(),
    String? status,
    Value<String?> notes = const Value.absent(),
    String? createdAt,
    String? updatedAt,
    Value<String?> currentRenterJson = const Value.absent(),
  }) => CachedRoom(
    id: id ?? this.id,
    houseId: houseId ?? this.houseId,
    roomNumber: roomNumber ?? this.roomNumber,
    floor: floor.present ? floor.value : this.floor,
    baseRent: baseRent ?? this.baseRent,
    meterAttached: meterAttached ?? this.meterAttached,
    meterNumber: meterNumber.present ? meterNumber.value : this.meterNumber,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    currentRenterJson: currentRenterJson.present
        ? currentRenterJson.value
        : this.currentRenterJson,
  );
  CachedRoom copyWithCompanion(CachedRoomsCompanion data) {
    return CachedRoom(
      id: data.id.present ? data.id.value : this.id,
      houseId: data.houseId.present ? data.houseId.value : this.houseId,
      roomNumber: data.roomNumber.present
          ? data.roomNumber.value
          : this.roomNumber,
      floor: data.floor.present ? data.floor.value : this.floor,
      baseRent: data.baseRent.present ? data.baseRent.value : this.baseRent,
      meterAttached: data.meterAttached.present
          ? data.meterAttached.value
          : this.meterAttached,
      meterNumber: data.meterNumber.present
          ? data.meterNumber.value
          : this.meterNumber,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      currentRenterJson: data.currentRenterJson.present
          ? data.currentRenterJson.value
          : this.currentRenterJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedRoom(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('floor: $floor, ')
          ..write('baseRent: $baseRent, ')
          ..write('meterAttached: $meterAttached, ')
          ..write('meterNumber: $meterNumber, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('currentRenterJson: $currentRenterJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    houseId,
    roomNumber,
    floor,
    baseRent,
    meterAttached,
    meterNumber,
    status,
    notes,
    createdAt,
    updatedAt,
    currentRenterJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedRoom &&
          other.id == this.id &&
          other.houseId == this.houseId &&
          other.roomNumber == this.roomNumber &&
          other.floor == this.floor &&
          other.baseRent == this.baseRent &&
          other.meterAttached == this.meterAttached &&
          other.meterNumber == this.meterNumber &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.currentRenterJson == this.currentRenterJson);
}

class CachedRoomsCompanion extends UpdateCompanion<CachedRoom> {
  final Value<String> id;
  final Value<String> houseId;
  final Value<String> roomNumber;
  final Value<int?> floor;
  final Value<String> baseRent;
  final Value<bool> meterAttached;
  final Value<String?> meterNumber;
  final Value<String> status;
  final Value<String?> notes;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String?> currentRenterJson;
  final Value<int> rowid;
  const CachedRoomsCompanion({
    this.id = const Value.absent(),
    this.houseId = const Value.absent(),
    this.roomNumber = const Value.absent(),
    this.floor = const Value.absent(),
    this.baseRent = const Value.absent(),
    this.meterAttached = const Value.absent(),
    this.meterNumber = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.currentRenterJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedRoomsCompanion.insert({
    required String id,
    required String houseId,
    required String roomNumber,
    this.floor = const Value.absent(),
    required String baseRent,
    required bool meterAttached,
    this.meterNumber = const Value.absent(),
    required String status,
    this.notes = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.currentRenterJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       houseId = Value(houseId),
       roomNumber = Value(roomNumber),
       baseRent = Value(baseRent),
       meterAttached = Value(meterAttached),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CachedRoom> custom({
    Expression<String>? id,
    Expression<String>? houseId,
    Expression<String>? roomNumber,
    Expression<int>? floor,
    Expression<String>? baseRent,
    Expression<bool>? meterAttached,
    Expression<String>? meterNumber,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? currentRenterJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseId != null) 'house_id': houseId,
      if (roomNumber != null) 'room_number': roomNumber,
      if (floor != null) 'floor': floor,
      if (baseRent != null) 'base_rent': baseRent,
      if (meterAttached != null) 'meter_attached': meterAttached,
      if (meterNumber != null) 'meter_number': meterNumber,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (currentRenterJson != null) 'current_renter_json': currentRenterJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedRoomsCompanion copyWith({
    Value<String>? id,
    Value<String>? houseId,
    Value<String>? roomNumber,
    Value<int?>? floor,
    Value<String>? baseRent,
    Value<bool>? meterAttached,
    Value<String?>? meterNumber,
    Value<String>? status,
    Value<String?>? notes,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<String?>? currentRenterJson,
    Value<int>? rowid,
  }) {
    return CachedRoomsCompanion(
      id: id ?? this.id,
      houseId: houseId ?? this.houseId,
      roomNumber: roomNumber ?? this.roomNumber,
      floor: floor ?? this.floor,
      baseRent: baseRent ?? this.baseRent,
      meterAttached: meterAttached ?? this.meterAttached,
      meterNumber: meterNumber ?? this.meterNumber,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      currentRenterJson: currentRenterJson ?? this.currentRenterJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<String>(houseId.value);
    }
    if (roomNumber.present) {
      map['room_number'] = Variable<String>(roomNumber.value);
    }
    if (floor.present) {
      map['floor'] = Variable<int>(floor.value);
    }
    if (baseRent.present) {
      map['base_rent'] = Variable<String>(baseRent.value);
    }
    if (meterAttached.present) {
      map['meter_attached'] = Variable<bool>(meterAttached.value);
    }
    if (meterNumber.present) {
      map['meter_number'] = Variable<String>(meterNumber.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (currentRenterJson.present) {
      map['current_renter_json'] = Variable<String>(currentRenterJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedRoomsCompanion(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('floor: $floor, ')
          ..write('baseRent: $baseRent, ')
          ..write('meterAttached: $meterAttached, ')
          ..write('meterNumber: $meterNumber, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('currentRenterJson: $currentRenterJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedBillConfigsTable extends CachedBillConfigs
    with TableInfo<$CachedBillConfigsTable, CachedBillConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedBillConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _houseIdMeta = const VerificationMeta(
    'houseId',
  );
  @override
  late final GeneratedColumn<String> houseId = GeneratedColumn<String>(
    'house_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _headMeta = const VerificationMeta('head');
  @override
  late final GeneratedColumn<String> head = GeneratedColumn<String>(
    'head',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _effectiveFromMeta = const VerificationMeta(
    'effectiveFrom',
  );
  @override
  late final GeneratedColumn<String> effectiveFrom = GeneratedColumn<String>(
    'effective_from',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _effectiveToMeta = const VerificationMeta(
    'effectiveTo',
  );
  @override
  late final GeneratedColumn<String> effectiveTo = GeneratedColumn<String>(
    'effective_to',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseId,
    head,
    label,
    amount,
    isActive,
    effectiveFrom,
    effectiveTo,
    createdBy,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_bill_configs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedBillConfig> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('house_id')) {
      context.handle(
        _houseIdMeta,
        houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('head')) {
      context.handle(
        _headMeta,
        head.isAcceptableOrUnknown(data['head']!, _headMeta),
      );
    } else if (isInserting) {
      context.missing(_headMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('effective_from')) {
      context.handle(
        _effectiveFromMeta,
        effectiveFrom.isAcceptableOrUnknown(
          data['effective_from']!,
          _effectiveFromMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_effectiveFromMeta);
    }
    if (data.containsKey('effective_to')) {
      context.handle(
        _effectiveToMeta,
        effectiveTo.isAcceptableOrUnknown(
          data['effective_to']!,
          _effectiveToMeta,
        ),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedBillConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedBillConfig(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      houseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_id'],
      )!,
      head: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}head'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      effectiveFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}effective_from'],
      )!,
      effectiveTo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}effective_to'],
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CachedBillConfigsTable createAlias(String alias) {
    return $CachedBillConfigsTable(attachedDatabase, alias);
  }
}

class CachedBillConfig extends DataClass
    implements Insertable<CachedBillConfig> {
  final String id;
  final String houseId;
  final String head;
  final String label;
  final String amount;
  final bool isActive;
  final String effectiveFrom;
  final String? effectiveTo;
  final String createdBy;
  final String createdAt;
  const CachedBillConfig({
    required this.id,
    required this.houseId,
    required this.head,
    required this.label,
    required this.amount,
    required this.isActive,
    required this.effectiveFrom,
    this.effectiveTo,
    required this.createdBy,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['house_id'] = Variable<String>(houseId);
    map['head'] = Variable<String>(head);
    map['label'] = Variable<String>(label);
    map['amount'] = Variable<String>(amount);
    map['is_active'] = Variable<bool>(isActive);
    map['effective_from'] = Variable<String>(effectiveFrom);
    if (!nullToAbsent || effectiveTo != null) {
      map['effective_to'] = Variable<String>(effectiveTo);
    }
    map['created_by'] = Variable<String>(createdBy);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  CachedBillConfigsCompanion toCompanion(bool nullToAbsent) {
    return CachedBillConfigsCompanion(
      id: Value(id),
      houseId: Value(houseId),
      head: Value(head),
      label: Value(label),
      amount: Value(amount),
      isActive: Value(isActive),
      effectiveFrom: Value(effectiveFrom),
      effectiveTo: effectiveTo == null && nullToAbsent
          ? const Value.absent()
          : Value(effectiveTo),
      createdBy: Value(createdBy),
      createdAt: Value(createdAt),
    );
  }

  factory CachedBillConfig.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedBillConfig(
      id: serializer.fromJson<String>(json['id']),
      houseId: serializer.fromJson<String>(json['houseId']),
      head: serializer.fromJson<String>(json['head']),
      label: serializer.fromJson<String>(json['label']),
      amount: serializer.fromJson<String>(json['amount']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      effectiveFrom: serializer.fromJson<String>(json['effectiveFrom']),
      effectiveTo: serializer.fromJson<String?>(json['effectiveTo']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'houseId': serializer.toJson<String>(houseId),
      'head': serializer.toJson<String>(head),
      'label': serializer.toJson<String>(label),
      'amount': serializer.toJson<String>(amount),
      'isActive': serializer.toJson<bool>(isActive),
      'effectiveFrom': serializer.toJson<String>(effectiveFrom),
      'effectiveTo': serializer.toJson<String?>(effectiveTo),
      'createdBy': serializer.toJson<String>(createdBy),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  CachedBillConfig copyWith({
    String? id,
    String? houseId,
    String? head,
    String? label,
    String? amount,
    bool? isActive,
    String? effectiveFrom,
    Value<String?> effectiveTo = const Value.absent(),
    String? createdBy,
    String? createdAt,
  }) => CachedBillConfig(
    id: id ?? this.id,
    houseId: houseId ?? this.houseId,
    head: head ?? this.head,
    label: label ?? this.label,
    amount: amount ?? this.amount,
    isActive: isActive ?? this.isActive,
    effectiveFrom: effectiveFrom ?? this.effectiveFrom,
    effectiveTo: effectiveTo.present ? effectiveTo.value : this.effectiveTo,
    createdBy: createdBy ?? this.createdBy,
    createdAt: createdAt ?? this.createdAt,
  );
  CachedBillConfig copyWithCompanion(CachedBillConfigsCompanion data) {
    return CachedBillConfig(
      id: data.id.present ? data.id.value : this.id,
      houseId: data.houseId.present ? data.houseId.value : this.houseId,
      head: data.head.present ? data.head.value : this.head,
      label: data.label.present ? data.label.value : this.label,
      amount: data.amount.present ? data.amount.value : this.amount,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      effectiveFrom: data.effectiveFrom.present
          ? data.effectiveFrom.value
          : this.effectiveFrom,
      effectiveTo: data.effectiveTo.present
          ? data.effectiveTo.value
          : this.effectiveTo,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedBillConfig(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('head: $head, ')
          ..write('label: $label, ')
          ..write('amount: $amount, ')
          ..write('isActive: $isActive, ')
          ..write('effectiveFrom: $effectiveFrom, ')
          ..write('effectiveTo: $effectiveTo, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    houseId,
    head,
    label,
    amount,
    isActive,
    effectiveFrom,
    effectiveTo,
    createdBy,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedBillConfig &&
          other.id == this.id &&
          other.houseId == this.houseId &&
          other.head == this.head &&
          other.label == this.label &&
          other.amount == this.amount &&
          other.isActive == this.isActive &&
          other.effectiveFrom == this.effectiveFrom &&
          other.effectiveTo == this.effectiveTo &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt);
}

class CachedBillConfigsCompanion extends UpdateCompanion<CachedBillConfig> {
  final Value<String> id;
  final Value<String> houseId;
  final Value<String> head;
  final Value<String> label;
  final Value<String> amount;
  final Value<bool> isActive;
  final Value<String> effectiveFrom;
  final Value<String?> effectiveTo;
  final Value<String> createdBy;
  final Value<String> createdAt;
  final Value<int> rowid;
  const CachedBillConfigsCompanion({
    this.id = const Value.absent(),
    this.houseId = const Value.absent(),
    this.head = const Value.absent(),
    this.label = const Value.absent(),
    this.amount = const Value.absent(),
    this.isActive = const Value.absent(),
    this.effectiveFrom = const Value.absent(),
    this.effectiveTo = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedBillConfigsCompanion.insert({
    required String id,
    required String houseId,
    required String head,
    required String label,
    required String amount,
    required bool isActive,
    required String effectiveFrom,
    this.effectiveTo = const Value.absent(),
    required String createdBy,
    required String createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       houseId = Value(houseId),
       head = Value(head),
       label = Value(label),
       amount = Value(amount),
       isActive = Value(isActive),
       effectiveFrom = Value(effectiveFrom),
       createdBy = Value(createdBy),
       createdAt = Value(createdAt);
  static Insertable<CachedBillConfig> custom({
    Expression<String>? id,
    Expression<String>? houseId,
    Expression<String>? head,
    Expression<String>? label,
    Expression<String>? amount,
    Expression<bool>? isActive,
    Expression<String>? effectiveFrom,
    Expression<String>? effectiveTo,
    Expression<String>? createdBy,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseId != null) 'house_id': houseId,
      if (head != null) 'head': head,
      if (label != null) 'label': label,
      if (amount != null) 'amount': amount,
      if (isActive != null) 'is_active': isActive,
      if (effectiveFrom != null) 'effective_from': effectiveFrom,
      if (effectiveTo != null) 'effective_to': effectiveTo,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedBillConfigsCompanion copyWith({
    Value<String>? id,
    Value<String>? houseId,
    Value<String>? head,
    Value<String>? label,
    Value<String>? amount,
    Value<bool>? isActive,
    Value<String>? effectiveFrom,
    Value<String?>? effectiveTo,
    Value<String>? createdBy,
    Value<String>? createdAt,
    Value<int>? rowid,
  }) {
    return CachedBillConfigsCompanion(
      id: id ?? this.id,
      houseId: houseId ?? this.houseId,
      head: head ?? this.head,
      label: label ?? this.label,
      amount: amount ?? this.amount,
      isActive: isActive ?? this.isActive,
      effectiveFrom: effectiveFrom ?? this.effectiveFrom,
      effectiveTo: effectiveTo ?? this.effectiveTo,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<String>(houseId.value);
    }
    if (head.present) {
      map['head'] = Variable<String>(head.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (effectiveFrom.present) {
      map['effective_from'] = Variable<String>(effectiveFrom.value);
    }
    if (effectiveTo.present) {
      map['effective_to'] = Variable<String>(effectiveTo.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedBillConfigsCompanion(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('head: $head, ')
          ..write('label: $label, ')
          ..write('amount: $amount, ')
          ..write('isActive: $isActive, ')
          ..write('effectiveFrom: $effectiveFrom, ')
          ..write('effectiveTo: $effectiveTo, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedRentersTable extends CachedRenters
    with TableInfo<$CachedRentersTable, CachedRenter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedRentersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _houseIdMeta = const VerificationMeta(
    'houseId',
  );
  @override
  late final GeneratedColumn<String> houseId = GeneratedColumn<String>(
    'house_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
    'mobile',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nidNumberMeta = const VerificationMeta(
    'nidNumber',
  );
  @override
  late final GeneratedColumn<String> nidNumber = GeneratedColumn<String>(
    'nid_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoUrlMeta = const VerificationMeta(
    'photoUrl',
  );
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
    'photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nidPhotoUrlMeta = const VerificationMeta(
    'nidPhotoUrl',
  );
  @override
  late final GeneratedColumn<String> nidPhotoUrl = GeneratedColumn<String>(
    'nid_photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _presentAddressMeta = const VerificationMeta(
    'presentAddress',
  );
  @override
  late final GeneratedColumn<String> presentAddress = GeneratedColumn<String>(
    'present_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _permanentAddressMeta = const VerificationMeta(
    'permanentAddress',
  );
  @override
  late final GeneratedColumn<String> permanentAddress = GeneratedColumn<String>(
    'permanent_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occupationMeta = const VerificationMeta(
    'occupation',
  );
  @override
  late final GeneratedColumn<String> occupation = GeneratedColumn<String>(
    'occupation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _organizationMeta = const VerificationMeta(
    'organization',
  );
  @override
  late final GeneratedColumn<String> organization = GeneratedColumn<String>(
    'organization',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String> emergencyContactName =
      GeneratedColumn<String>(
        'emergency_contact_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _emergencyContactMobileMeta =
      const VerificationMeta('emergencyContactMobile');
  @override
  late final GeneratedColumn<String> emergencyContactMobile =
      GeneratedColumn<String>(
        'emergency_contact_mobile',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _advanceAmountMeta = const VerificationMeta(
    'advanceAmount',
  );
  @override
  late final GeneratedColumn<String> advanceAmount = GeneratedColumn<String>(
    'advance_amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentAssignmentJsonMeta =
      const VerificationMeta('currentAssignmentJson');
  @override
  late final GeneratedColumn<String> currentAssignmentJson =
      GeneratedColumn<String>(
        'current_assignment_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseId,
    fullName,
    mobile,
    nidNumber,
    photoUrl,
    nidPhotoUrl,
    presentAddress,
    permanentAddress,
    occupation,
    organization,
    emergencyContactName,
    emergencyContactMobile,
    advanceAmount,
    status,
    createdBy,
    createdAt,
    updatedAt,
    currentAssignmentJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_renters';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedRenter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('house_id')) {
      context.handle(
        _houseIdMeta,
        houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('mobile')) {
      context.handle(
        _mobileMeta,
        mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta),
      );
    } else if (isInserting) {
      context.missing(_mobileMeta);
    }
    if (data.containsKey('nid_number')) {
      context.handle(
        _nidNumberMeta,
        nidNumber.isAcceptableOrUnknown(data['nid_number']!, _nidNumberMeta),
      );
    }
    if (data.containsKey('photo_url')) {
      context.handle(
        _photoUrlMeta,
        photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta),
      );
    }
    if (data.containsKey('nid_photo_url')) {
      context.handle(
        _nidPhotoUrlMeta,
        nidPhotoUrl.isAcceptableOrUnknown(
          data['nid_photo_url']!,
          _nidPhotoUrlMeta,
        ),
      );
    }
    if (data.containsKey('present_address')) {
      context.handle(
        _presentAddressMeta,
        presentAddress.isAcceptableOrUnknown(
          data['present_address']!,
          _presentAddressMeta,
        ),
      );
    }
    if (data.containsKey('permanent_address')) {
      context.handle(
        _permanentAddressMeta,
        permanentAddress.isAcceptableOrUnknown(
          data['permanent_address']!,
          _permanentAddressMeta,
        ),
      );
    }
    if (data.containsKey('occupation')) {
      context.handle(
        _occupationMeta,
        occupation.isAcceptableOrUnknown(data['occupation']!, _occupationMeta),
      );
    }
    if (data.containsKey('organization')) {
      context.handle(
        _organizationMeta,
        organization.isAcceptableOrUnknown(
          data['organization']!,
          _organizationMeta,
        ),
      );
    }
    if (data.containsKey('emergency_contact_name')) {
      context.handle(
        _emergencyContactNameMeta,
        emergencyContactName.isAcceptableOrUnknown(
          data['emergency_contact_name']!,
          _emergencyContactNameMeta,
        ),
      );
    }
    if (data.containsKey('emergency_contact_mobile')) {
      context.handle(
        _emergencyContactMobileMeta,
        emergencyContactMobile.isAcceptableOrUnknown(
          data['emergency_contact_mobile']!,
          _emergencyContactMobileMeta,
        ),
      );
    }
    if (data.containsKey('advance_amount')) {
      context.handle(
        _advanceAmountMeta,
        advanceAmount.isAcceptableOrUnknown(
          data['advance_amount']!,
          _advanceAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_advanceAmountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('current_assignment_json')) {
      context.handle(
        _currentAssignmentJsonMeta,
        currentAssignmentJson.isAcceptableOrUnknown(
          data['current_assignment_json']!,
          _currentAssignmentJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedRenter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedRenter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      houseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      mobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile'],
      )!,
      nidNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nid_number'],
      ),
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
      nidPhotoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nid_photo_url'],
      ),
      presentAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}present_address'],
      ),
      permanentAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}permanent_address'],
      ),
      occupation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occupation'],
      ),
      organization: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization'],
      ),
      emergencyContactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_name'],
      ),
      emergencyContactMobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_mobile'],
      ),
      advanceAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}advance_amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
      currentAssignmentJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_assignment_json'],
      ),
    );
  }

  @override
  $CachedRentersTable createAlias(String alias) {
    return $CachedRentersTable(attachedDatabase, alias);
  }
}

class CachedRenter extends DataClass implements Insertable<CachedRenter> {
  final String id;
  final String houseId;
  final String fullName;
  final String mobile;
  final String? nidNumber;
  final String? photoUrl;
  final String? nidPhotoUrl;
  final String? presentAddress;
  final String? permanentAddress;
  final String? occupation;
  final String? organization;
  final String? emergencyContactName;
  final String? emergencyContactMobile;
  final String advanceAmount;
  final String status;
  final String createdBy;
  final String createdAt;
  final String updatedAt;
  final String? currentAssignmentJson;
  const CachedRenter({
    required this.id,
    required this.houseId,
    required this.fullName,
    required this.mobile,
    this.nidNumber,
    this.photoUrl,
    this.nidPhotoUrl,
    this.presentAddress,
    this.permanentAddress,
    this.occupation,
    this.organization,
    this.emergencyContactName,
    this.emergencyContactMobile,
    required this.advanceAmount,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.currentAssignmentJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['house_id'] = Variable<String>(houseId);
    map['full_name'] = Variable<String>(fullName);
    map['mobile'] = Variable<String>(mobile);
    if (!nullToAbsent || nidNumber != null) {
      map['nid_number'] = Variable<String>(nidNumber);
    }
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    if (!nullToAbsent || nidPhotoUrl != null) {
      map['nid_photo_url'] = Variable<String>(nidPhotoUrl);
    }
    if (!nullToAbsent || presentAddress != null) {
      map['present_address'] = Variable<String>(presentAddress);
    }
    if (!nullToAbsent || permanentAddress != null) {
      map['permanent_address'] = Variable<String>(permanentAddress);
    }
    if (!nullToAbsent || occupation != null) {
      map['occupation'] = Variable<String>(occupation);
    }
    if (!nullToAbsent || organization != null) {
      map['organization'] = Variable<String>(organization);
    }
    if (!nullToAbsent || emergencyContactName != null) {
      map['emergency_contact_name'] = Variable<String>(emergencyContactName);
    }
    if (!nullToAbsent || emergencyContactMobile != null) {
      map['emergency_contact_mobile'] = Variable<String>(
        emergencyContactMobile,
      );
    }
    map['advance_amount'] = Variable<String>(advanceAmount);
    map['status'] = Variable<String>(status);
    map['created_by'] = Variable<String>(createdBy);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    if (!nullToAbsent || currentAssignmentJson != null) {
      map['current_assignment_json'] = Variable<String>(currentAssignmentJson);
    }
    return map;
  }

  CachedRentersCompanion toCompanion(bool nullToAbsent) {
    return CachedRentersCompanion(
      id: Value(id),
      houseId: Value(houseId),
      fullName: Value(fullName),
      mobile: Value(mobile),
      nidNumber: nidNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(nidNumber),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      nidPhotoUrl: nidPhotoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(nidPhotoUrl),
      presentAddress: presentAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(presentAddress),
      permanentAddress: permanentAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(permanentAddress),
      occupation: occupation == null && nullToAbsent
          ? const Value.absent()
          : Value(occupation),
      organization: organization == null && nullToAbsent
          ? const Value.absent()
          : Value(organization),
      emergencyContactName: emergencyContactName == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContactName),
      emergencyContactMobile: emergencyContactMobile == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContactMobile),
      advanceAmount: Value(advanceAmount),
      status: Value(status),
      createdBy: Value(createdBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      currentAssignmentJson: currentAssignmentJson == null && nullToAbsent
          ? const Value.absent()
          : Value(currentAssignmentJson),
    );
  }

  factory CachedRenter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedRenter(
      id: serializer.fromJson<String>(json['id']),
      houseId: serializer.fromJson<String>(json['houseId']),
      fullName: serializer.fromJson<String>(json['fullName']),
      mobile: serializer.fromJson<String>(json['mobile']),
      nidNumber: serializer.fromJson<String?>(json['nidNumber']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      nidPhotoUrl: serializer.fromJson<String?>(json['nidPhotoUrl']),
      presentAddress: serializer.fromJson<String?>(json['presentAddress']),
      permanentAddress: serializer.fromJson<String?>(json['permanentAddress']),
      occupation: serializer.fromJson<String?>(json['occupation']),
      organization: serializer.fromJson<String?>(json['organization']),
      emergencyContactName: serializer.fromJson<String?>(
        json['emergencyContactName'],
      ),
      emergencyContactMobile: serializer.fromJson<String?>(
        json['emergencyContactMobile'],
      ),
      advanceAmount: serializer.fromJson<String>(json['advanceAmount']),
      status: serializer.fromJson<String>(json['status']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      currentAssignmentJson: serializer.fromJson<String?>(
        json['currentAssignmentJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'houseId': serializer.toJson<String>(houseId),
      'fullName': serializer.toJson<String>(fullName),
      'mobile': serializer.toJson<String>(mobile),
      'nidNumber': serializer.toJson<String?>(nidNumber),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'nidPhotoUrl': serializer.toJson<String?>(nidPhotoUrl),
      'presentAddress': serializer.toJson<String?>(presentAddress),
      'permanentAddress': serializer.toJson<String?>(permanentAddress),
      'occupation': serializer.toJson<String?>(occupation),
      'organization': serializer.toJson<String?>(organization),
      'emergencyContactName': serializer.toJson<String?>(emergencyContactName),
      'emergencyContactMobile': serializer.toJson<String?>(
        emergencyContactMobile,
      ),
      'advanceAmount': serializer.toJson<String>(advanceAmount),
      'status': serializer.toJson<String>(status),
      'createdBy': serializer.toJson<String>(createdBy),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'currentAssignmentJson': serializer.toJson<String?>(
        currentAssignmentJson,
      ),
    };
  }

  CachedRenter copyWith({
    String? id,
    String? houseId,
    String? fullName,
    String? mobile,
    Value<String?> nidNumber = const Value.absent(),
    Value<String?> photoUrl = const Value.absent(),
    Value<String?> nidPhotoUrl = const Value.absent(),
    Value<String?> presentAddress = const Value.absent(),
    Value<String?> permanentAddress = const Value.absent(),
    Value<String?> occupation = const Value.absent(),
    Value<String?> organization = const Value.absent(),
    Value<String?> emergencyContactName = const Value.absent(),
    Value<String?> emergencyContactMobile = const Value.absent(),
    String? advanceAmount,
    String? status,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    Value<String?> currentAssignmentJson = const Value.absent(),
  }) => CachedRenter(
    id: id ?? this.id,
    houseId: houseId ?? this.houseId,
    fullName: fullName ?? this.fullName,
    mobile: mobile ?? this.mobile,
    nidNumber: nidNumber.present ? nidNumber.value : this.nidNumber,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
    nidPhotoUrl: nidPhotoUrl.present ? nidPhotoUrl.value : this.nidPhotoUrl,
    presentAddress: presentAddress.present
        ? presentAddress.value
        : this.presentAddress,
    permanentAddress: permanentAddress.present
        ? permanentAddress.value
        : this.permanentAddress,
    occupation: occupation.present ? occupation.value : this.occupation,
    organization: organization.present ? organization.value : this.organization,
    emergencyContactName: emergencyContactName.present
        ? emergencyContactName.value
        : this.emergencyContactName,
    emergencyContactMobile: emergencyContactMobile.present
        ? emergencyContactMobile.value
        : this.emergencyContactMobile,
    advanceAmount: advanceAmount ?? this.advanceAmount,
    status: status ?? this.status,
    createdBy: createdBy ?? this.createdBy,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    currentAssignmentJson: currentAssignmentJson.present
        ? currentAssignmentJson.value
        : this.currentAssignmentJson,
  );
  CachedRenter copyWithCompanion(CachedRentersCompanion data) {
    return CachedRenter(
      id: data.id.present ? data.id.value : this.id,
      houseId: data.houseId.present ? data.houseId.value : this.houseId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      nidNumber: data.nidNumber.present ? data.nidNumber.value : this.nidNumber,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      nidPhotoUrl: data.nidPhotoUrl.present
          ? data.nidPhotoUrl.value
          : this.nidPhotoUrl,
      presentAddress: data.presentAddress.present
          ? data.presentAddress.value
          : this.presentAddress,
      permanentAddress: data.permanentAddress.present
          ? data.permanentAddress.value
          : this.permanentAddress,
      occupation: data.occupation.present
          ? data.occupation.value
          : this.occupation,
      organization: data.organization.present
          ? data.organization.value
          : this.organization,
      emergencyContactName: data.emergencyContactName.present
          ? data.emergencyContactName.value
          : this.emergencyContactName,
      emergencyContactMobile: data.emergencyContactMobile.present
          ? data.emergencyContactMobile.value
          : this.emergencyContactMobile,
      advanceAmount: data.advanceAmount.present
          ? data.advanceAmount.value
          : this.advanceAmount,
      status: data.status.present ? data.status.value : this.status,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      currentAssignmentJson: data.currentAssignmentJson.present
          ? data.currentAssignmentJson.value
          : this.currentAssignmentJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedRenter(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('fullName: $fullName, ')
          ..write('mobile: $mobile, ')
          ..write('nidNumber: $nidNumber, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('nidPhotoUrl: $nidPhotoUrl, ')
          ..write('presentAddress: $presentAddress, ')
          ..write('permanentAddress: $permanentAddress, ')
          ..write('occupation: $occupation, ')
          ..write('organization: $organization, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactMobile: $emergencyContactMobile, ')
          ..write('advanceAmount: $advanceAmount, ')
          ..write('status: $status, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('currentAssignmentJson: $currentAssignmentJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    houseId,
    fullName,
    mobile,
    nidNumber,
    photoUrl,
    nidPhotoUrl,
    presentAddress,
    permanentAddress,
    occupation,
    organization,
    emergencyContactName,
    emergencyContactMobile,
    advanceAmount,
    status,
    createdBy,
    createdAt,
    updatedAt,
    currentAssignmentJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedRenter &&
          other.id == this.id &&
          other.houseId == this.houseId &&
          other.fullName == this.fullName &&
          other.mobile == this.mobile &&
          other.nidNumber == this.nidNumber &&
          other.photoUrl == this.photoUrl &&
          other.nidPhotoUrl == this.nidPhotoUrl &&
          other.presentAddress == this.presentAddress &&
          other.permanentAddress == this.permanentAddress &&
          other.occupation == this.occupation &&
          other.organization == this.organization &&
          other.emergencyContactName == this.emergencyContactName &&
          other.emergencyContactMobile == this.emergencyContactMobile &&
          other.advanceAmount == this.advanceAmount &&
          other.status == this.status &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.currentAssignmentJson == this.currentAssignmentJson);
}

class CachedRentersCompanion extends UpdateCompanion<CachedRenter> {
  final Value<String> id;
  final Value<String> houseId;
  final Value<String> fullName;
  final Value<String> mobile;
  final Value<String?> nidNumber;
  final Value<String?> photoUrl;
  final Value<String?> nidPhotoUrl;
  final Value<String?> presentAddress;
  final Value<String?> permanentAddress;
  final Value<String?> occupation;
  final Value<String?> organization;
  final Value<String?> emergencyContactName;
  final Value<String?> emergencyContactMobile;
  final Value<String> advanceAmount;
  final Value<String> status;
  final Value<String> createdBy;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String?> currentAssignmentJson;
  final Value<int> rowid;
  const CachedRentersCompanion({
    this.id = const Value.absent(),
    this.houseId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.nidNumber = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.nidPhotoUrl = const Value.absent(),
    this.presentAddress = const Value.absent(),
    this.permanentAddress = const Value.absent(),
    this.occupation = const Value.absent(),
    this.organization = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactMobile = const Value.absent(),
    this.advanceAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.currentAssignmentJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedRentersCompanion.insert({
    required String id,
    required String houseId,
    required String fullName,
    required String mobile,
    this.nidNumber = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.nidPhotoUrl = const Value.absent(),
    this.presentAddress = const Value.absent(),
    this.permanentAddress = const Value.absent(),
    this.occupation = const Value.absent(),
    this.organization = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactMobile = const Value.absent(),
    required String advanceAmount,
    required String status,
    required String createdBy,
    required String createdAt,
    required String updatedAt,
    this.currentAssignmentJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       houseId = Value(houseId),
       fullName = Value(fullName),
       mobile = Value(mobile),
       advanceAmount = Value(advanceAmount),
       status = Value(status),
       createdBy = Value(createdBy),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CachedRenter> custom({
    Expression<String>? id,
    Expression<String>? houseId,
    Expression<String>? fullName,
    Expression<String>? mobile,
    Expression<String>? nidNumber,
    Expression<String>? photoUrl,
    Expression<String>? nidPhotoUrl,
    Expression<String>? presentAddress,
    Expression<String>? permanentAddress,
    Expression<String>? occupation,
    Expression<String>? organization,
    Expression<String>? emergencyContactName,
    Expression<String>? emergencyContactMobile,
    Expression<String>? advanceAmount,
    Expression<String>? status,
    Expression<String>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? currentAssignmentJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseId != null) 'house_id': houseId,
      if (fullName != null) 'full_name': fullName,
      if (mobile != null) 'mobile': mobile,
      if (nidNumber != null) 'nid_number': nidNumber,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (nidPhotoUrl != null) 'nid_photo_url': nidPhotoUrl,
      if (presentAddress != null) 'present_address': presentAddress,
      if (permanentAddress != null) 'permanent_address': permanentAddress,
      if (occupation != null) 'occupation': occupation,
      if (organization != null) 'organization': organization,
      if (emergencyContactName != null)
        'emergency_contact_name': emergencyContactName,
      if (emergencyContactMobile != null)
        'emergency_contact_mobile': emergencyContactMobile,
      if (advanceAmount != null) 'advance_amount': advanceAmount,
      if (status != null) 'status': status,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (currentAssignmentJson != null)
        'current_assignment_json': currentAssignmentJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedRentersCompanion copyWith({
    Value<String>? id,
    Value<String>? houseId,
    Value<String>? fullName,
    Value<String>? mobile,
    Value<String?>? nidNumber,
    Value<String?>? photoUrl,
    Value<String?>? nidPhotoUrl,
    Value<String?>? presentAddress,
    Value<String?>? permanentAddress,
    Value<String?>? occupation,
    Value<String?>? organization,
    Value<String?>? emergencyContactName,
    Value<String?>? emergencyContactMobile,
    Value<String>? advanceAmount,
    Value<String>? status,
    Value<String>? createdBy,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<String?>? currentAssignmentJson,
    Value<int>? rowid,
  }) {
    return CachedRentersCompanion(
      id: id ?? this.id,
      houseId: houseId ?? this.houseId,
      fullName: fullName ?? this.fullName,
      mobile: mobile ?? this.mobile,
      nidNumber: nidNumber ?? this.nidNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      nidPhotoUrl: nidPhotoUrl ?? this.nidPhotoUrl,
      presentAddress: presentAddress ?? this.presentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      occupation: occupation ?? this.occupation,
      organization: organization ?? this.organization,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactMobile:
          emergencyContactMobile ?? this.emergencyContactMobile,
      advanceAmount: advanceAmount ?? this.advanceAmount,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      currentAssignmentJson:
          currentAssignmentJson ?? this.currentAssignmentJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<String>(houseId.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (nidNumber.present) {
      map['nid_number'] = Variable<String>(nidNumber.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (nidPhotoUrl.present) {
      map['nid_photo_url'] = Variable<String>(nidPhotoUrl.value);
    }
    if (presentAddress.present) {
      map['present_address'] = Variable<String>(presentAddress.value);
    }
    if (permanentAddress.present) {
      map['permanent_address'] = Variable<String>(permanentAddress.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(occupation.value);
    }
    if (organization.present) {
      map['organization'] = Variable<String>(organization.value);
    }
    if (emergencyContactName.present) {
      map['emergency_contact_name'] = Variable<String>(
        emergencyContactName.value,
      );
    }
    if (emergencyContactMobile.present) {
      map['emergency_contact_mobile'] = Variable<String>(
        emergencyContactMobile.value,
      );
    }
    if (advanceAmount.present) {
      map['advance_amount'] = Variable<String>(advanceAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (currentAssignmentJson.present) {
      map['current_assignment_json'] = Variable<String>(
        currentAssignmentJson.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedRentersCompanion(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('fullName: $fullName, ')
          ..write('mobile: $mobile, ')
          ..write('nidNumber: $nidNumber, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('nidPhotoUrl: $nidPhotoUrl, ')
          ..write('presentAddress: $presentAddress, ')
          ..write('permanentAddress: $permanentAddress, ')
          ..write('occupation: $occupation, ')
          ..write('organization: $organization, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactMobile: $emergencyContactMobile, ')
          ..write('advanceAmount: $advanceAmount, ')
          ..write('status: $status, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('currentAssignmentJson: $currentAssignmentJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedHousesTable cachedHouses = $CachedHousesTable(this);
  late final $CachedRoomsTable cachedRooms = $CachedRoomsTable(this);
  late final $CachedBillConfigsTable cachedBillConfigs =
      $CachedBillConfigsTable(this);
  late final $CachedRentersTable cachedRenters = $CachedRentersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedHouses,
    cachedRooms,
    cachedBillConfigs,
    cachedRenters,
  ];
}

typedef $$CachedHousesTableCreateCompanionBuilder =
    CachedHousesCompanion Function({
      required String id,
      required String ownerId,
      required String name,
      Value<String?> address,
      Value<String?> city,
      Value<int?> totalFloors,
      Value<String?> notes,
      required String createdAt,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$CachedHousesTableUpdateCompanionBuilder =
    CachedHousesCompanion Function({
      Value<String> id,
      Value<String> ownerId,
      Value<String> name,
      Value<String?> address,
      Value<String?> city,
      Value<int?> totalFloors,
      Value<String?> notes,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<int> rowid,
    });

class $$CachedHousesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedHousesTable> {
  $$CachedHousesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalFloors => $composableBuilder(
    column: $table.totalFloors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedHousesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedHousesTable> {
  $$CachedHousesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalFloors => $composableBuilder(
    column: $table.totalFloors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedHousesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedHousesTable> {
  $$CachedHousesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<int> get totalFloors => $composableBuilder(
    column: $table.totalFloors,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedHousesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedHousesTable,
          CachedHouse,
          $$CachedHousesTableFilterComposer,
          $$CachedHousesTableOrderingComposer,
          $$CachedHousesTableAnnotationComposer,
          $$CachedHousesTableCreateCompanionBuilder,
          $$CachedHousesTableUpdateCompanionBuilder,
          (
            CachedHouse,
            BaseReferences<_$AppDatabase, $CachedHousesTable, CachedHouse>,
          ),
          CachedHouse,
          PrefetchHooks Function()
        > {
  $$CachedHousesTableTableManager(_$AppDatabase db, $CachedHousesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedHousesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedHousesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedHousesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<int?> totalFloors = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedHousesCompanion(
                id: id,
                ownerId: ownerId,
                name: name,
                address: address,
                city: city,
                totalFloors: totalFloors,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerId,
                required String name,
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<int?> totalFloors = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String createdAt,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedHousesCompanion.insert(
                id: id,
                ownerId: ownerId,
                name: name,
                address: address,
                city: city,
                totalFloors: totalFloors,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedHousesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedHousesTable,
      CachedHouse,
      $$CachedHousesTableFilterComposer,
      $$CachedHousesTableOrderingComposer,
      $$CachedHousesTableAnnotationComposer,
      $$CachedHousesTableCreateCompanionBuilder,
      $$CachedHousesTableUpdateCompanionBuilder,
      (
        CachedHouse,
        BaseReferences<_$AppDatabase, $CachedHousesTable, CachedHouse>,
      ),
      CachedHouse,
      PrefetchHooks Function()
    >;
typedef $$CachedRoomsTableCreateCompanionBuilder =
    CachedRoomsCompanion Function({
      required String id,
      required String houseId,
      required String roomNumber,
      Value<int?> floor,
      required String baseRent,
      required bool meterAttached,
      Value<String?> meterNumber,
      required String status,
      Value<String?> notes,
      required String createdAt,
      required String updatedAt,
      Value<String?> currentRenterJson,
      Value<int> rowid,
    });
typedef $$CachedRoomsTableUpdateCompanionBuilder =
    CachedRoomsCompanion Function({
      Value<String> id,
      Value<String> houseId,
      Value<String> roomNumber,
      Value<int?> floor,
      Value<String> baseRent,
      Value<bool> meterAttached,
      Value<String?> meterNumber,
      Value<String> status,
      Value<String?> notes,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<String?> currentRenterJson,
      Value<int> rowid,
    });

class $$CachedRoomsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedRoomsTable> {
  $$CachedRoomsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get houseId => $composableBuilder(
    column: $table.houseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomNumber => $composableBuilder(
    column: $table.roomNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseRent => $composableBuilder(
    column: $table.baseRent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get meterAttached => $composableBuilder(
    column: $table.meterAttached,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meterNumber => $composableBuilder(
    column: $table.meterNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentRenterJson => $composableBuilder(
    column: $table.currentRenterJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedRoomsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedRoomsTable> {
  $$CachedRoomsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get houseId => $composableBuilder(
    column: $table.houseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomNumber => $composableBuilder(
    column: $table.roomNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseRent => $composableBuilder(
    column: $table.baseRent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get meterAttached => $composableBuilder(
    column: $table.meterAttached,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meterNumber => $composableBuilder(
    column: $table.meterNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentRenterJson => $composableBuilder(
    column: $table.currentRenterJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedRoomsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedRoomsTable> {
  $$CachedRoomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get houseId =>
      $composableBuilder(column: $table.houseId, builder: (column) => column);

  GeneratedColumn<String> get roomNumber => $composableBuilder(
    column: $table.roomNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get floor =>
      $composableBuilder(column: $table.floor, builder: (column) => column);

  GeneratedColumn<String> get baseRent =>
      $composableBuilder(column: $table.baseRent, builder: (column) => column);

  GeneratedColumn<bool> get meterAttached => $composableBuilder(
    column: $table.meterAttached,
    builder: (column) => column,
  );

  GeneratedColumn<String> get meterNumber => $composableBuilder(
    column: $table.meterNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get currentRenterJson => $composableBuilder(
    column: $table.currentRenterJson,
    builder: (column) => column,
  );
}

class $$CachedRoomsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedRoomsTable,
          CachedRoom,
          $$CachedRoomsTableFilterComposer,
          $$CachedRoomsTableOrderingComposer,
          $$CachedRoomsTableAnnotationComposer,
          $$CachedRoomsTableCreateCompanionBuilder,
          $$CachedRoomsTableUpdateCompanionBuilder,
          (
            CachedRoom,
            BaseReferences<_$AppDatabase, $CachedRoomsTable, CachedRoom>,
          ),
          CachedRoom,
          PrefetchHooks Function()
        > {
  $$CachedRoomsTableTableManager(_$AppDatabase db, $CachedRoomsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedRoomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedRoomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedRoomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> houseId = const Value.absent(),
                Value<String> roomNumber = const Value.absent(),
                Value<int?> floor = const Value.absent(),
                Value<String> baseRent = const Value.absent(),
                Value<bool> meterAttached = const Value.absent(),
                Value<String?> meterNumber = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<String?> currentRenterJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedRoomsCompanion(
                id: id,
                houseId: houseId,
                roomNumber: roomNumber,
                floor: floor,
                baseRent: baseRent,
                meterAttached: meterAttached,
                meterNumber: meterNumber,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                currentRenterJson: currentRenterJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String houseId,
                required String roomNumber,
                Value<int?> floor = const Value.absent(),
                required String baseRent,
                required bool meterAttached,
                Value<String?> meterNumber = const Value.absent(),
                required String status,
                Value<String?> notes = const Value.absent(),
                required String createdAt,
                required String updatedAt,
                Value<String?> currentRenterJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedRoomsCompanion.insert(
                id: id,
                houseId: houseId,
                roomNumber: roomNumber,
                floor: floor,
                baseRent: baseRent,
                meterAttached: meterAttached,
                meterNumber: meterNumber,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                currentRenterJson: currentRenterJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedRoomsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedRoomsTable,
      CachedRoom,
      $$CachedRoomsTableFilterComposer,
      $$CachedRoomsTableOrderingComposer,
      $$CachedRoomsTableAnnotationComposer,
      $$CachedRoomsTableCreateCompanionBuilder,
      $$CachedRoomsTableUpdateCompanionBuilder,
      (
        CachedRoom,
        BaseReferences<_$AppDatabase, $CachedRoomsTable, CachedRoom>,
      ),
      CachedRoom,
      PrefetchHooks Function()
    >;
typedef $$CachedBillConfigsTableCreateCompanionBuilder =
    CachedBillConfigsCompanion Function({
      required String id,
      required String houseId,
      required String head,
      required String label,
      required String amount,
      required bool isActive,
      required String effectiveFrom,
      Value<String?> effectiveTo,
      required String createdBy,
      required String createdAt,
      Value<int> rowid,
    });
typedef $$CachedBillConfigsTableUpdateCompanionBuilder =
    CachedBillConfigsCompanion Function({
      Value<String> id,
      Value<String> houseId,
      Value<String> head,
      Value<String> label,
      Value<String> amount,
      Value<bool> isActive,
      Value<String> effectiveFrom,
      Value<String?> effectiveTo,
      Value<String> createdBy,
      Value<String> createdAt,
      Value<int> rowid,
    });

class $$CachedBillConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedBillConfigsTable> {
  $$CachedBillConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get houseId => $composableBuilder(
    column: $table.houseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get head => $composableBuilder(
    column: $table.head,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get effectiveFrom => $composableBuilder(
    column: $table.effectiveFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get effectiveTo => $composableBuilder(
    column: $table.effectiveTo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedBillConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedBillConfigsTable> {
  $$CachedBillConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get houseId => $composableBuilder(
    column: $table.houseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get head => $composableBuilder(
    column: $table.head,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get effectiveFrom => $composableBuilder(
    column: $table.effectiveFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get effectiveTo => $composableBuilder(
    column: $table.effectiveTo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedBillConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedBillConfigsTable> {
  $$CachedBillConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get houseId =>
      $composableBuilder(column: $table.houseId, builder: (column) => column);

  GeneratedColumn<String> get head =>
      $composableBuilder(column: $table.head, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get effectiveFrom => $composableBuilder(
    column: $table.effectiveFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get effectiveTo => $composableBuilder(
    column: $table.effectiveTo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CachedBillConfigsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedBillConfigsTable,
          CachedBillConfig,
          $$CachedBillConfigsTableFilterComposer,
          $$CachedBillConfigsTableOrderingComposer,
          $$CachedBillConfigsTableAnnotationComposer,
          $$CachedBillConfigsTableCreateCompanionBuilder,
          $$CachedBillConfigsTableUpdateCompanionBuilder,
          (
            CachedBillConfig,
            BaseReferences<
              _$AppDatabase,
              $CachedBillConfigsTable,
              CachedBillConfig
            >,
          ),
          CachedBillConfig,
          PrefetchHooks Function()
        > {
  $$CachedBillConfigsTableTableManager(
    _$AppDatabase db,
    $CachedBillConfigsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedBillConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedBillConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedBillConfigsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> houseId = const Value.absent(),
                Value<String> head = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String> effectiveFrom = const Value.absent(),
                Value<String?> effectiveTo = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedBillConfigsCompanion(
                id: id,
                houseId: houseId,
                head: head,
                label: label,
                amount: amount,
                isActive: isActive,
                effectiveFrom: effectiveFrom,
                effectiveTo: effectiveTo,
                createdBy: createdBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String houseId,
                required String head,
                required String label,
                required String amount,
                required bool isActive,
                required String effectiveFrom,
                Value<String?> effectiveTo = const Value.absent(),
                required String createdBy,
                required String createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedBillConfigsCompanion.insert(
                id: id,
                houseId: houseId,
                head: head,
                label: label,
                amount: amount,
                isActive: isActive,
                effectiveFrom: effectiveFrom,
                effectiveTo: effectiveTo,
                createdBy: createdBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedBillConfigsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedBillConfigsTable,
      CachedBillConfig,
      $$CachedBillConfigsTableFilterComposer,
      $$CachedBillConfigsTableOrderingComposer,
      $$CachedBillConfigsTableAnnotationComposer,
      $$CachedBillConfigsTableCreateCompanionBuilder,
      $$CachedBillConfigsTableUpdateCompanionBuilder,
      (
        CachedBillConfig,
        BaseReferences<
          _$AppDatabase,
          $CachedBillConfigsTable,
          CachedBillConfig
        >,
      ),
      CachedBillConfig,
      PrefetchHooks Function()
    >;
typedef $$CachedRentersTableCreateCompanionBuilder =
    CachedRentersCompanion Function({
      required String id,
      required String houseId,
      required String fullName,
      required String mobile,
      Value<String?> nidNumber,
      Value<String?> photoUrl,
      Value<String?> nidPhotoUrl,
      Value<String?> presentAddress,
      Value<String?> permanentAddress,
      Value<String?> occupation,
      Value<String?> organization,
      Value<String?> emergencyContactName,
      Value<String?> emergencyContactMobile,
      required String advanceAmount,
      required String status,
      required String createdBy,
      required String createdAt,
      required String updatedAt,
      Value<String?> currentAssignmentJson,
      Value<int> rowid,
    });
typedef $$CachedRentersTableUpdateCompanionBuilder =
    CachedRentersCompanion Function({
      Value<String> id,
      Value<String> houseId,
      Value<String> fullName,
      Value<String> mobile,
      Value<String?> nidNumber,
      Value<String?> photoUrl,
      Value<String?> nidPhotoUrl,
      Value<String?> presentAddress,
      Value<String?> permanentAddress,
      Value<String?> occupation,
      Value<String?> organization,
      Value<String?> emergencyContactName,
      Value<String?> emergencyContactMobile,
      Value<String> advanceAmount,
      Value<String> status,
      Value<String> createdBy,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<String?> currentAssignmentJson,
      Value<int> rowid,
    });

class $$CachedRentersTableFilterComposer
    extends Composer<_$AppDatabase, $CachedRentersTable> {
  $$CachedRentersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get houseId => $composableBuilder(
    column: $table.houseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nidNumber => $composableBuilder(
    column: $table.nidNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nidPhotoUrl => $composableBuilder(
    column: $table.nidPhotoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get presentAddress => $composableBuilder(
    column: $table.presentAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get permanentAddress => $composableBuilder(
    column: $table.permanentAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organization => $composableBuilder(
    column: $table.organization,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactMobile => $composableBuilder(
    column: $table.emergencyContactMobile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get advanceAmount => $composableBuilder(
    column: $table.advanceAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentAssignmentJson => $composableBuilder(
    column: $table.currentAssignmentJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedRentersTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedRentersTable> {
  $$CachedRentersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get houseId => $composableBuilder(
    column: $table.houseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nidNumber => $composableBuilder(
    column: $table.nidNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nidPhotoUrl => $composableBuilder(
    column: $table.nidPhotoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get presentAddress => $composableBuilder(
    column: $table.presentAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get permanentAddress => $composableBuilder(
    column: $table.permanentAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organization => $composableBuilder(
    column: $table.organization,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactMobile => $composableBuilder(
    column: $table.emergencyContactMobile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get advanceAmount => $composableBuilder(
    column: $table.advanceAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentAssignmentJson => $composableBuilder(
    column: $table.currentAssignmentJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedRentersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedRentersTable> {
  $$CachedRentersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get houseId =>
      $composableBuilder(column: $table.houseId, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get nidNumber =>
      $composableBuilder(column: $table.nidNumber, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<String> get nidPhotoUrl => $composableBuilder(
    column: $table.nidPhotoUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get presentAddress => $composableBuilder(
    column: $table.presentAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get permanentAddress => $composableBuilder(
    column: $table.permanentAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get organization => $composableBuilder(
    column: $table.organization,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactMobile => $composableBuilder(
    column: $table.emergencyContactMobile,
    builder: (column) => column,
  );

  GeneratedColumn<String> get advanceAmount => $composableBuilder(
    column: $table.advanceAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get currentAssignmentJson => $composableBuilder(
    column: $table.currentAssignmentJson,
    builder: (column) => column,
  );
}

class $$CachedRentersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedRentersTable,
          CachedRenter,
          $$CachedRentersTableFilterComposer,
          $$CachedRentersTableOrderingComposer,
          $$CachedRentersTableAnnotationComposer,
          $$CachedRentersTableCreateCompanionBuilder,
          $$CachedRentersTableUpdateCompanionBuilder,
          (
            CachedRenter,
            BaseReferences<_$AppDatabase, $CachedRentersTable, CachedRenter>,
          ),
          CachedRenter,
          PrefetchHooks Function()
        > {
  $$CachedRentersTableTableManager(_$AppDatabase db, $CachedRentersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedRentersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedRentersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedRentersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> houseId = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> mobile = const Value.absent(),
                Value<String?> nidNumber = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<String?> nidPhotoUrl = const Value.absent(),
                Value<String?> presentAddress = const Value.absent(),
                Value<String?> permanentAddress = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> organization = const Value.absent(),
                Value<String?> emergencyContactName = const Value.absent(),
                Value<String?> emergencyContactMobile = const Value.absent(),
                Value<String> advanceAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<String?> currentAssignmentJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedRentersCompanion(
                id: id,
                houseId: houseId,
                fullName: fullName,
                mobile: mobile,
                nidNumber: nidNumber,
                photoUrl: photoUrl,
                nidPhotoUrl: nidPhotoUrl,
                presentAddress: presentAddress,
                permanentAddress: permanentAddress,
                occupation: occupation,
                organization: organization,
                emergencyContactName: emergencyContactName,
                emergencyContactMobile: emergencyContactMobile,
                advanceAmount: advanceAmount,
                status: status,
                createdBy: createdBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                currentAssignmentJson: currentAssignmentJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String houseId,
                required String fullName,
                required String mobile,
                Value<String?> nidNumber = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<String?> nidPhotoUrl = const Value.absent(),
                Value<String?> presentAddress = const Value.absent(),
                Value<String?> permanentAddress = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> organization = const Value.absent(),
                Value<String?> emergencyContactName = const Value.absent(),
                Value<String?> emergencyContactMobile = const Value.absent(),
                required String advanceAmount,
                required String status,
                required String createdBy,
                required String createdAt,
                required String updatedAt,
                Value<String?> currentAssignmentJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedRentersCompanion.insert(
                id: id,
                houseId: houseId,
                fullName: fullName,
                mobile: mobile,
                nidNumber: nidNumber,
                photoUrl: photoUrl,
                nidPhotoUrl: nidPhotoUrl,
                presentAddress: presentAddress,
                permanentAddress: permanentAddress,
                occupation: occupation,
                organization: organization,
                emergencyContactName: emergencyContactName,
                emergencyContactMobile: emergencyContactMobile,
                advanceAmount: advanceAmount,
                status: status,
                createdBy: createdBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                currentAssignmentJson: currentAssignmentJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedRentersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedRentersTable,
      CachedRenter,
      $$CachedRentersTableFilterComposer,
      $$CachedRentersTableOrderingComposer,
      $$CachedRentersTableAnnotationComposer,
      $$CachedRentersTableCreateCompanionBuilder,
      $$CachedRentersTableUpdateCompanionBuilder,
      (
        CachedRenter,
        BaseReferences<_$AppDatabase, $CachedRentersTable, CachedRenter>,
      ),
      CachedRenter,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedHousesTableTableManager get cachedHouses =>
      $$CachedHousesTableTableManager(_db, _db.cachedHouses);
  $$CachedRoomsTableTableManager get cachedRooms =>
      $$CachedRoomsTableTableManager(_db, _db.cachedRooms);
  $$CachedBillConfigsTableTableManager get cachedBillConfigs =>
      $$CachedBillConfigsTableTableManager(_db, _db.cachedBillConfigs);
  $$CachedRentersTableTableManager get cachedRenters =>
      $$CachedRentersTableTableManager(_db, _db.cachedRenters);
}
