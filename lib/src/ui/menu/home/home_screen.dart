import 'package:flutter/material.dart';
import 'package:laffyuu/src/block/category_block.dart';
import 'package:laffyuu/src/block/product_block.dart';
import 'package:laffyuu/src/block/rec_product_block.dart';
import 'package:laffyuu/src/block/super_flash_block.dart';
import 'package:laffyuu/src/model/category_model.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:laffyuu/src/model/rec_product_model.dart';
import 'package:laffyuu/src/model/super_flash_model.dart';
import 'package:laffyuu/src/widgets/app_bar_widget.dart';
import 'package:laffyuu/src/widgets/category_widget.dart';
import 'package:laffyuu/src/widgets/product_widget.dart';
import 'package:laffyuu/src/widgets/rec_product_widget.dart';
import 'package:laffyuu/src/widgets/see_more_widget.dart';
import 'package:laffyuu/src/widgets/super_flash_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SuperFlashModel? superFlashModel;
  CategoryModel? categoryModel;
  ProductModel? productModel;
  RecProductModel? recProductModel;

  @override
  void initState() {
    homeBlock.allSuperFlash();
    categoryBlock.allCategoryModel();
    productBlock.allProductFlashSale();
    productBlock.allProductMegaSale();
    recProductBlock.allRecProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget.getAppBar(context),
        body: ListView(
          children: [
            SizedBox(
                height: 206,
                child: StreamBuilder<SuperFlashModel>(
                    stream: homeBlock.getSuperFlash,
                    builder: (context, snapshot) {
                      if (snapshot.hasData || superFlashModel != null) {
                        if (snapshot.hasData) {
                          superFlashModel = snapshot.data!;
                        }
                        return SuperFlashWidget(data: superFlashModel!);
                      }
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    })),
            SeeMoreWidget(
                leftText: "Category",
                rightText: "More Category",
                rightOnTap: () {}),
            const SizedBox(height: 12.0),
            SizedBox(
                height: 108,
                child: StreamBuilder<CategoryModel>(
                    stream: categoryBlock.getCategory,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        CategoryModel data = snapshot.data!;
                        return Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.results.length,
                              itemBuilder: (context, index) {
                                return CategoryWidget(
                                  data: data.results[index],
                                  width: 70.0,
                                  margin: const EdgeInsets.only(right: 16.0),
                                );
                              }),
                        );
                      }
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    })),
            const SizedBox(
              height: 24.0,
            ),
            SeeMoreWidget(
                leftText: "Flash Sale",
                rightText: "See More",
                rightOnTap: () {}),
            SizedBox(
              height: 274,
              child: StreamBuilder<ProductModel>(
                stream: productBlock.getProductFlashSale,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ProductModel data = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.results.length,
                      itemBuilder: (context, index) {
                        return ProductWidget(
                          data: data.results[index],
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ),
            SeeMoreWidget(
                leftText: "Mega Sale",
                rightText: "See More",
                rightOnTap: () {}),
            SizedBox(
              height: 274,
              child: StreamBuilder<ProductModel>(
                stream: productBlock.getProductMegaSale,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ProductModel data = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.results.length,
                      itemBuilder: (context, index) {
                        return ProductWidget(
                          data: data.results[index],
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 206.0,
              child: StreamBuilder<RecProductModel>(
                  stream: recProductBlock.getRecProduct,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      RecProductModel data = snapshot.data!;
                      return ListView.builder(
                          itemCount: data.results.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return RecProductWidget(data2: data.results[index]);
                          });
                    }
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }),
            ),
          ],
        ));
  }
}
