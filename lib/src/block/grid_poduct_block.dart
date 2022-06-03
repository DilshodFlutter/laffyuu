import 'package:laffyuu/src/api/provider.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:rxdart/rxdart.dart';

class GridProductBlock {
  final _appProvider = AppProvider();
  final _fetchProductModel = PublishSubject<ProductModel>();

  Stream<ProductModel> get getGridProduct => _fetchProductModel.stream;

  allGridProduct() async {
    ProductModel productModel = await _appProvider.getGridProduct();
    _fetchProductModel.add(productModel);
  }
}

final gridProductBlock = GridProductBlock();
