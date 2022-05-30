import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel {
  CategoryModel({
    required this.count,
    required this.results,
  });

  int count;
  List<Result> results;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        count: json["count"] ?? 0,
        results: json["results"] == null
            ? <Result>[]
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.image,
    required this.genderTypes,
    required this.genderType,
    required this.childs,
  });

  int id;
  String name;
  String image;
  int genderTypes;
  GenderTypeClass genderType;
  List<dynamic> childs;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        genderTypes: json["gender_types"] ?? 0,
        genderType: json["gender_type"] == null
            ? GenderTypeClass.fromJson({})
            : GenderTypeClass.fromJson(json["gender_type"]),
        childs: json["childs"] == null
            ? <CategoryModel>[]
            : List<CategoryModel>.from(json["childs"].map((x) => x)),
      );
}

class GenderTypeClass {
  GenderTypeClass({
    required this.id,
    required this.genderType,
  });

  int id;
  String genderType;

  factory GenderTypeClass.fromJson(Map<String, dynamic> json) =>
      GenderTypeClass(
        id: json["id"] ?? 0,
        genderType: json["gender_type"] ?? "",
      );
}
