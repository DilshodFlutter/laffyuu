import 'package:flutter/cupertino.dart';
import 'package:laffyuu/src/colors/app_color.dart';

class SeeMoreWidget extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Function() rightOnTap;

  const SeeMoreWidget({
    Key? key,
    required this.leftText,
    required this.rightText,
    required this.rightOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              leftText,
              style: const TextStyle(
                  color: AppColor.dark,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppColor.fontFamilyPoppins,
                  letterSpacing: 0.5),
            ),
          ),
          GestureDetector(
            onTap: () {
              rightOnTap();
            },
            child: Text(
              rightText,
              style: const TextStyle(
                  color: AppColor.blue,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppColor.fontFamilyPoppins,
                  letterSpacing: 0.5),
            ),
          )
        ],
      ),
    );
  }
}
