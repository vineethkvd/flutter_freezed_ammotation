import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.g.dart';
part 'post_model.freezed.dart';

@freezed
class PostsModel with _$PostsModel {
  const factory PostsModel({
    @JsonKey(name: "userId") required int userId,
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "body") required String body,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);
}
