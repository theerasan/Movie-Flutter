import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_dto.freezed.dart';
part 'cast_dto.g.dart';

@freezed
abstract class CastDTO with _$CastDTO {
  const factory CastDTO({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'profile_path') required String profilePath,
    @JsonKey(name: 'character') required String character
  }) = _CastDTO;

  factory CastDTO.fromJson(Map<String, dynamic> json) => _$CastDTOFromJson(json);
}