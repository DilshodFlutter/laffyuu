import 'dart:convert';

import 'package:laffyuu/src/model/category_model.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:laffyuu/src/model/super_flash_model.dart';
import 'package:http/http.dart' as http;

class AppProvider {
  static String baseUrl = "http://lafyuu.qtlms.uz/api/v1/";

  Future<SuperFlashModel> getData() async {
    String url = baseUrl + "superflash";
    http.Response response = await http.get(Uri.parse(url));
    final superFlashModel =
        SuperFlashModel.fromJson(json.decode(response.body));
    return superFlashModel;
  }

  Future<CategoryModel> getCategory() async {
    String url = baseUrl + "category";
    http.Response response = await http.get(Uri.parse(url));
    final categoryModel = CategoryModel.fromJson(json.decode(response.body));
    return categoryModel;
  }

  Future<ProductModel> getProduct() async {
    String url = baseUrl + "product";
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    final productModel = ProductModel.fromJson(json.decode(response.body));
    print(response.statusCode);
    return productModel;
  }
}
