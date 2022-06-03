import 'dart:convert';

import 'package:laffyuu/src/model/category_model.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:laffyuu/src/model/rec_product_model.dart';
import 'package:laffyuu/src/model/super_flash_model.dart';
import 'package:http/http.dart' as http;

class AppProvider {
  static String baseUrl = "http://lafyuu.qtlms.uz/api/v1/";

  Future<SuperFlashModel> getSuperFlash() async {
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

  Future<ProductModel> getProductFlashSale() async {
    String url = baseUrl + "product?flash_sale=true";

    http.Response response = await http.get(Uri.parse(url));

    final productModel = ProductModel.fromJson(json.decode(response.body));

    return productModel;
  }

  Future<ProductModel> getProductMegaSale() async {
    String url = baseUrl + "product?mega_sale=true";

    http.Response response = await http.get(Uri.parse(url));

    final productModel = ProductModel.fromJson(json.decode(response.body));

    return productModel;
  }

  Future<ProductModel> getProductHomeSale() async {
    String url = baseUrl + "product";

    http.Response response = await http.get(Uri.parse(url));

    final productModel = ProductModel.fromJson(json.decode(response.body));

    return productModel;
  }

  Future<RecProductModel> getRecProduct() async {
    String url = baseUrl + "recomendedproduct";
    http.Response response = await http.get(Uri.parse(url));
    final recProductModel =
        RecProductModel.fromJson(json.decode(response.body));
    return recProductModel;
  }

  Future<ProductModel> getGridProduct() async {
    String url = baseUrl + "product";
    http.Response response = await http.get(Uri.parse(url));
    final productModel = ProductModel.fromJson(json.decode(response.body));
    return productModel;
  }
}
