import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_dto.freezed.dart';
part 'genre_dto.g.dart';

@freezed
abstract class GenreDTO with _$GenreDTO {
  const factory GenreDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _GenreDTO;

  factory GenreDTO.fromJson(Map<String, dynamic> json) =>
      _$GenreDTOFromJson(json);
}
