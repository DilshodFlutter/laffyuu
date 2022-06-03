class RecProductModel {
  RecProductModel({
    required this.count,
    required this.results,
  });

  int count;
  List<RecProductResult> results;

  factory RecProductModel.fromJson(Map<String, dynamic> json) =>
      RecProductModel(
        count: json["count"] ?? 0,
        results: json["results"] == null
            ? <RecProductResult>[]
            : List<RecProductResult>.from(
                json["results"].map((x) => RecProductResult.fromJson(x))),
      );
}

class RecProductResult {
  RecProductResult({
    required this.id,
    required this.image,
    required this.name,
    required this.title,
    required this.product,
  });

  int id;
  String image;
  String name;
  String title;
  int product;

  factory RecProductResult.fromJson(Map<String, dynamic> json) =>
      RecProductResult(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        title: json["title"] ?? "",
        product: json["product"] ?? 0,
      );
}
