import 'package:laffyuu/src/api/provider.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:rxdart/subjects.dart';

class ProductBlock {
  final _appProvider = AppProvider();
  final _fetchProductModel = PublishSubject<ProductModel>();

  Stream<ProductModel> get getProduct => _fetchProductModel.stream;

  allProductModel() async {
    ProductModel productModel = await _appProvider.getProduct();
    _fetchProductModel.add(productModel);
  }
}

final productBlock = ProductBlock();
