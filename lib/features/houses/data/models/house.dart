import 'package:freezed_annotation/freezed_annotation.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
abstract class House with _$House {
  const factory House({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String name,
    String? address,
    String? city,
    @JsonKey(name: 'total_floors') int? totalFloors,
    String? notes,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}
