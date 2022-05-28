import 'package:flutter/material.dart';
import 'package:laffyuu/src/block/category_block.dart';
import 'package:laffyuu/src/block/product_block.dart';
import 'package:laffyuu/src/block/super_flash_block.dart';
import 'package:laffyuu/src/model/category_model.dart';
import 'package:laffyuu/src/model/product_model.dart';
import 'package:laffyuu/src/model/super_flash_model.dart';
import 'package:laffyuu/src/widgets/app_bar_widget.dart';
import 'package:laffyuu/src/widgets/category_widget.dart';
import 'package:laffyuu/src/widgets/product_widget.dart';
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

  @override
  void initState() {
    homeBlock.allSuperFlash();
    categoryBlock.allCategoryModel();
    productBlock.allProductModel();
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
                    stream: homeBlock.getData,
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
            SizedBox(
                height: 80,
                child: StreamBuilder<CategoryModel>(
                    stream: categoryBlock.getCategory,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        CategoryModel data = snapshot.data!;
                        return ListView.builder(
                            padding: const EdgeInsets.only(bottom: 24, top: 12),
                            scrollDirection: Axis.horizontal,
                            itemCount: data.results.length,
                            itemBuilder: (context, index) {
                              return CategoryWidget(
                                data: data.results[index],
                                width: 70.0,
                                margin: const EdgeInsets.only(right: 16.0),
                              );
                            });
                      }
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    })),
            // SizedBox(
            //     height: 300,
            //     child: StreamBuilder<ProductModel>(
            //         stream: productBlock.getProduct,
            //         builder: (context, snapshot) {
            //           if (snapshot.hasData) {
            //             ProductModel data = snapshot.data!;
            //             return ListView.builder(
            //                 scrollDirection: Axis.horizontal,
            //                 itemCount: data.results.length,
            //                 itemBuilder: (context, index) {
            //                   return ProductWidget(data: data.results[index]);
            //                 });
            //           }
            //           return const Center(
            //               child: CircularProgressIndicator.adaptive());
            //         }))
          ],
        ));
  }
}
