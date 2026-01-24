import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_nav_bar.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/cart/presentation/view/cart_view.dart';
import 'package:food/features/home/presentation/view/home_view.dart';
import 'package:food/features/order_history/presentation/view/order_history_view.dart';
import 'package:food/features/auth/presentation/view/profile_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  final List<Widget> screens = const [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.textSecondary,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: CustomBtnNavigation(
              currentIndex: currentIndex,
              index: 0,
              icon: Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: CustomBtnNavigation(
              currentIndex: currentIndex,
              index: 1,
              icon: Icons.add_shopping_cart,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: CustomBtnNavigation(
              currentIndex: currentIndex,
              index: 2,
              icon: Icons.fastfood_outlined,
            ),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: CustomBtnNavigation(
              currentIndex: currentIndex,
              index: 3,
              icon: Icons.person_outlined,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
