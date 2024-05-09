
import 'package:freezed_annotation/freezed_annotation.dart';


part 'song_model.g.dart';
part 'song_model.freezed.dart';


@freezed
class SongModel with _$SongModel {
  const factory SongModel({
    int? sno,
    String? label,
    String? title,
    String? artist,
    int? release_date,
    String? genre,
    String? description,
    String? lyrics,
    int? likes,
    int? many,
    String? image_path,
    String? mp3_path
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) => _$SongModelFromJson(json);
}
