import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

class ProductModel {
  ProductModel({
    required this.count,
    required this.results,
  });

  int count;
  List<ProductResult> results;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        count: json["count"] ?? 0,
        results: json["result"] == null
            ? <ProductResult>[]
            : List<ProductResult>.from(json["results"].map((x) => ProductResult.fromJson(x))),
      );
}

class ProductResult {
  ProductResult({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.reviewAvg,
  });

  int id;
  String name;
  int price;
  int discountPrice;
  Images images;
  int reviewAvg;

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0,
        images: json["images"] ?? "",
        reviewAvg: json["review_avg"] ?? 0,
      );
}

class Images {
  Images({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        product: json["product"] ?? 0,
      );
}
