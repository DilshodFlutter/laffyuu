import 'package:flutter/material.dart';
import 'package:laffyuu/src/colors/app_color.dart';
import 'package:laffyuu/src/ui/menu/cart/cart_screen.dart';
import 'package:laffyuu/src/ui/menu/explore/explore_screen.dart';
import 'package:laffyuu/src/ui/menu/home/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'account/account_screen.dart';
import 'offer/offer_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
          const HomeScreen(),
          const ExploreScreen(),
          const CartScreen(),
          const OfferScreen(),
          const AccountScreen()
        ][_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10.0,
          selectedItemColor: AppColor.blue,
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: AppColor.fontFamilyPoppins,
              letterSpacing: 0.5),
          currentIndex: _selectedIndex,
          onTap: (_index) {
            setState(() {
              _selectedIndex = _index;
            });
          },
          unselectedLabelStyle: const TextStyle(
              color: AppColor.grey,
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontFamily: AppColor.fontFamilyPoppins),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home_icon.svg",
                  color: _selectedIndex == 0 ? AppColor.blue : AppColor.grey,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/search_main.svg",
                    color: _selectedIndex == 1 ? AppColor.blue : AppColor.grey),
                label: "explore"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/cart_icon.svg",
                    color: _selectedIndex == 2 ? AppColor.blue : AppColor.grey),
                label: "cart"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/offer_icon.svg",
                    color: _selectedIndex == 3 ? AppColor.blue : AppColor.grey),
                label: "ofer"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/user_icon.svg",
                    color: _selectedIndex == 4 ? AppColor.blue : AppColor.grey),
                label: "Account",
                backgroundColor: Colors.black)
          ],
        ));
  }
}
