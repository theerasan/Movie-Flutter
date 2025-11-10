
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pop_corn/data/model/movie_detail/cast_dto.dart';

part 'credits_dto.freezed.dart';
part 'credits_dto.g.dart';

@freezed
abstract class CreditsDTO with _$CreditsDTO {
  const factory CreditsDTO({
    @JsonKey(name: 'cast') required List<CastDTO> casts,
  }) = _CreditsDTO;

  factory CreditsDTO.fromJson(Map<String, dynamic> json) => _$CreditsDTOFromJson(json);
}