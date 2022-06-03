import 'package:laffyuu/src/api/provider.dart';
import 'package:laffyuu/src/model/rec_product_model.dart';
import 'package:rxdart/rxdart.dart';

class RecProductBlock {
  final _appProvider = AppProvider();
  final _fetchRecProduct = PublishSubject<RecProductModel>();

  Stream<RecProductModel> get getRecProduct => _fetchRecProduct.stream;

  allRecProduct() async {
    RecProductModel recProductModel = await _appProvider.getRecProduct();
    _fetchRecProduct.add(recProductModel);
  }
}

final recProductBlock = RecProductBlock();