import 'dart:convert';

SuperFlashModel superFlashModelFromJson(String str) =>
    SuperFlashModel.fromJson(json.decode(str));

class SuperFlashModel {
  SuperFlashModel({
    required this.count,
    required this.results,
  });

  int count;
  List<SuperFlashResult> results;

  factory SuperFlashModel.fromJson(Map<String, dynamic> json) =>
      SuperFlashModel(
        count: json["count"] ?? 0,
        results: json["results"] == null
            ? <SuperFlashResult>[]
            : List<SuperFlashResult>.from(json["results"].map((x) => SuperFlashResult.fromJson(x))),
      );
}

class SuperFlashResult {
  SuperFlashResult({
    required this.id,
    required this.image,
    required this.name,
    required this.percent,
  });

  int id;
  String image;
  String name;
  int percent;

  factory SuperFlashResult.fromJson(Map<String, dynamic> json) => SuperFlashResult(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
      );
}
