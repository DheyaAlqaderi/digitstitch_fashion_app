import 'package:digitstitch_app/features/digitstitch/cart/presentation/pages/cart_page.dart';
import 'package:digitstitch_app/features/digitstitch/profile/presentation/pages/profile_page.dart';
import 'package:digitstitch_app/features/digitstitch/wishlist/presentation/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../Home/presentation/pages/home/home_page.dart';
import '../widgets/bottom_nav.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int _bottomNavIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const CartPage(),
    const WishlistPage(),
    const WishlistPage(),
  ];

  List<String> titleList = [
    'الرئيسية',
    'السلة',
    'المفضلة',
    'الحساب',
  ];

  final List<IconData> lineIconsList = [
    LineIcons.home,
    LineIcons.shoppingCart,
    LineIcons.heart,
    LineIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _bottomNavIndex != 0
          ? buildAppBar()
          : null,
      body: Center(
        child: IndexedStack(
          index: _bottomNavIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNav(
        bottomNavIndex: _bottomNavIndex,
        titles: titleList,
        icons: lineIconsList,
        onTabChange: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),

    );
  }


  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleList[_bottomNavIndex],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          const Icon(Icons.notifications, color: Colors.black, size: 30.0),
        ],
      ),
      elevation: 0.0,
    );
  }

}