// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditsDTO _$CreditsDTOFromJson(Map<String, dynamic> json) => _CreditsDTO(
  casts: (json['cast'] as List<dynamic>)
      .map((e) => CastDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreditsDTOToJson(_CreditsDTO instance) =>
    <String, dynamic>{'cast': instance.casts};
