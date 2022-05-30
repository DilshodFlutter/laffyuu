import 'package:flutter/material.dart';
import 'package:laffyuu/src/colors/app_color.dart';
import 'package:laffyuu/src/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final Result data;
  final double width;
  final EdgeInsets margin;

  const CategoryWidget(
      {Key? key,
      required this.data,
      required this.width,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      child: Column(
        children: [
          const SizedBox(width: 16,),
          Container(
          //  margin: const EdgeInsets.only(left: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: AppColor.light),
                borderRadius: BorderRadius.circular(35.0)),
            child: Center(child: Image.network(data.image)),
          ),
        ],
      ),
    );
  }
}
