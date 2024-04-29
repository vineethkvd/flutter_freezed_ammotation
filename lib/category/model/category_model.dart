// flutter pub run build_runner watch --delete-conflicting-outputs
//ptf pts fjc
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';
part 'category_model.freezed.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel(
      {@JsonKey(name: "status") required bool status,
        @JsonKey(name: "message") @Default("") String message,
      @JsonKey(name: "data") @Default([])  List<Data> data}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data(
      {@JsonKey(name: "catId") @Default("")  String catId,
      @JsonKey(name: "categoryName") @Default("") @Default("") String categoryName,
      @JsonKey(name: "catImg") @Default("")  String catImg,
      @JsonKey(name: "catStatus") @Default("")  String catStatus}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
