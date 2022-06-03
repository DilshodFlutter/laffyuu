import 'package:laffyuu/src/api/provider.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:rxdart/subjects.dart';

class ProductBlock {
  final _appProvider = AppProvider();
  final _fetchProductFlashSale = PublishSubject<ProductModel>();
  final _fetchProductMegaSale = PublishSubject<ProductModel>();

  Stream<ProductModel> get getProductMegaSale => _fetchProductMegaSale.stream;

  Stream<ProductModel> get getProductFlashSale => _fetchProductFlashSale.stream;

  allProductMegaSale() async {
    ProductModel productModel2 = await _appProvider.getProductMegaSale();
    _fetchProductMegaSale.add(productModel2);
  }

  allProductFlashSale() async {
    ProductModel productModel = await _appProvider.getProductFlashSale();
    _fetchProductFlashSale.add(productModel);
  }
}

final productBlock = ProductBlock();
