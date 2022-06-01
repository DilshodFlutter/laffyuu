import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laffyuu/src/colors/app_color.dart';
import 'package:laffyuu/src/model/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductResult data;

  const ProductWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, top: 12.0, bottom: 24.0),
      padding: const EdgeInsets.all(16.0),
      //height: 238,
      width: 141,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.light),
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              data.images.image,
              fit: BoxFit.cover,
              height: 109,
              width: 109,
            ),
          ),
          const SizedBox(
            height: 8
          ),
          Expanded(
            child: Text(
              data.name,
              maxLines: 2,
              style: const TextStyle(
                  color: AppColor.dark,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  fontFamily: AppColor.fontFamilyPoppins),
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: Text(
              data.price.toString(),
              style: const TextStyle(
                color: AppColor.blue,
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 0.5,
                fontFamily: AppColor.fontFamilyPoppins,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                data.discountPrice.toString(),
                style: const TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.0,
                  letterSpacing: 0.5,
                  fontFamily: AppColor.fontFamilyPoppins,
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                "24 % Off",
                style: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.0,
                  letterSpacing: 0.5,
                  fontFamily: AppColor.fontFamilyPoppins,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
