class ProductModel {
  ProductModel({
    required this.count,
    required this.results,
  });

  int count;
  List<ProductResult> results;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      count: json["count"] ?? 0,
      results: json["results"] == null
          ? <ProductResult>[]
          : List<ProductResult>.from(
              json["results"].map((x) => ProductResult.fromJson(x))),
    );
  }
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
  double discountPrice;
  ProductImages images;
  double reviewAvg;

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0,
        images: json["images"] == null
            ? ProductImages.fromJson({})
            : ProductImages.fromJson(json["images"]),
        reviewAvg: json["review_avg"] ?? 0,
      );
}

class ProductImages {
  ProductImages({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory ProductImages.fromJson(Map<String, dynamic> json) => ProductImages(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        product: json["product"] ?? 0,
      );
}
