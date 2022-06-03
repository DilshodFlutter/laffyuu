import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laffyuu/src/colors/app_color.dart';
import 'package:laffyuu/src/model/rec_product_model.dart';

class RecProductWidget extends StatelessWidget {
  final RecProductResult data2;

  const RecProductWidget({Key? key, required this.data2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      height: 206,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                data2.image,
                height: 206,
                width: MediaQuery.of(context).size.width - 32.0,
                fit: BoxFit.cover,
              )),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 48.0, left: 24.0),
                width: 169,
                height: 72,
                child: const Text("Recomended Product",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      fontFamily: AppColor.fontFamilyPoppins,
                    ),
                    maxLines: 2),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0, left: 24.0),
                child: const Text("We recommend the best for you",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 12.0,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppColor.fontFamilyPoppins,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
