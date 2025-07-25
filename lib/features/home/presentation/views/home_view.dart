import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/features/home/presentation/views/cart_view.dart';
import 'package:electronics_shop/features/home/presentation/views/favourite_view.dart';
import 'package:electronics_shop/features/home/presentation/views/main_view.dart';
import 'package:electronics_shop/features/search/presentation/views/search_view.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  final List<_NavItem> navItems = [
    _NavItem(label: 'Home', image: Assets.images.home2SvgrepoCom),
    _NavItem(label: 'Browse', image: Assets.images.searchSvgrepoCom),
    _NavItem(label: 'Favourite', image: Assets.images.favouriteSvgrepoCom),
    _NavItem(label: 'Cart', image: Assets.images.cart),
    _NavItem(label: 'Profile', image: Assets.images.profile1335SvgrepoCom),
  ];

  final List<Widget> screens = [
    MainView(),
    SearchView(),
    FavouriteView(),
    CartView(),
  ];

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: screens[selectedIndex],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              return CustomBottomNavBarItem(
                label: item.label,
                imageUrl: item.image,
                isActive: index == selectedIndex,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    print(selectedIndex);
                  });
                },
              );
            }),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   var res = await AuthCubit().getUserData();
      //   print(res);
      // }),
    );
  }
}

class _NavItem {
  final String label;
  final String image;

  const _NavItem({required this.label, required this.image});
}
