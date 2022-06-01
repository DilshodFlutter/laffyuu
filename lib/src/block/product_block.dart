import 'package:laffyuu/src/api/provider.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:rxdart/subjects.dart';

class ProductBlock {
  final _appProvider = AppProvider();
  final _fetchProductFlashSale = PublishSubject<ProductModel>();

  final _fetchProductFlashSale2 = PublishSubject<ProductModel>();

  Stream<ProductModel> get getProductFlashSale2 =>
      _fetchProductFlashSale2.stream;

  Stream<ProductModel> get getProductFlashSale => _fetchProductFlashSale.stream;

  allProductFlashSale2() async {
    ProductModel productModel2 = await _appProvider.getProduct();
    _fetchProductFlashSale2.add(productModel2);
  }

  allProductFlashSale() async {
    ProductModel productModel = await _appProvider.getProduct();
    _fetchProductFlashSale.add(productModel);
  }
}

final productBlock = ProductBlock();
