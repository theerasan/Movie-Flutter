// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CastDTO _$CastDTOFromJson(Map<String, dynamic> json) => _CastDTO(
  id: json['id'] as String,
  name: json['name'] as String,
  profilePath: json['profile_path'] as String,
  character: json['character'] as String,
);

Map<String, dynamic> _$CastDTOToJson(_CastDTO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'profile_path': instance.profilePath,
  'character': instance.character,
};
