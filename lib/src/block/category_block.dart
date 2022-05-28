import 'package:laffyuu/src/api/provider.dart';
import 'package:laffyuu/src/model/category_model.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBlock {
  final _appProvider = AppProvider();
  final _fetchCategoryModel = PublishSubject<CategoryModel>();

  Stream<CategoryModel> get getCategory => _fetchCategoryModel.stream;

  allCategoryModel() async {
    CategoryModel categoryModel = await _appProvider.getCategory();
    _fetchCategoryModel.add(categoryModel);
  }
}

final categoryBlock = CategoryBlock();
