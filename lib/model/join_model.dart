
import 'package:freezed_annotation/freezed_annotation.dart';


part 'join_model.g.dart';
part 'join_model.freezed.dart';


@freezed
class JoinModel with _$JoinModel {
  const factory JoinModel({
    String? id,
    String? pw,
    String? pw2,
    String? email,
    String? name

  }) = _JoinModel;

  factory JoinModel.fromJson(Map<String, dynamic> json) => _$JoinModelFromJson(json);
}
