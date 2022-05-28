import 'package:flutter/material.dart';
import 'package:laffyuu/src/colors/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ui/search/search_screen.dart';

class AppBarWidget {
  static getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.white,
      title: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SearchScreen();
          }));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.light),
              borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/search_icon.svg",
                color: AppColor.blue,
              ),
              const SizedBox(width: 8),
              const Text(
                "Search Product",
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 12,
                    fontFamily: AppColor.fontFamilyPoppins,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
      ),
      actions: [
        SvgPicture.asset(
          "assets/icons/love_icon.svg",
          height: 24.0,
          width: 24.0,
        ),
        const SizedBox(
          width: 16,
        ),
        SvgPicture.asset(
          "assets/icons/notification_icon.svg",
          height: 24.0,
          width: 24.0,
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
