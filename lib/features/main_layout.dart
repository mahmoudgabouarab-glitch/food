import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/widgets/custom_bar_layout.dart';
import 'package:food/features/Favorites/presentation/view/favorites_view.dart';
import 'package:food/features/home/data/repo/home_repo_impl.dart';
import 'package:food/features/home/presentation/view_model/vaf_products_cubit/fav_products_cubit.dart';
import 'package:food/features/settings/data/repo/profile_repo_impl.dart';
import 'package:food/features/settings/presentation/view/settings_view.dart';
import 'package:food/features/settings/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/cart/data/repo/cart_repo_impl.dart';
import 'package:food/features/cart/presentation/view/cart_view.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:food/features/home/presentation/view/home_view.dart';
import 'package:food/features/order_history/data/repo/order_history_repo_impl.dart';
import 'package:food/features/order_history/presentation/view/order_history_view.dart';
import 'package:food/features/order_history/presentation/view_model/cubit/order_history_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    if (isGuest) {
      return BlocProvider(
        create: (context) => FavProductsCubit(getIt<HomeRepoImpl>()),
        child: const _MainLayoutView(),
      );
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProfileCubit(getIt<ProfileRepoImpl>())..getProfile(),
        ),
        BlocProvider(
          create: (_) => CartCubit(getIt<CartRepoImpl>())..getCart(),
        ),
        BlocProvider(
          create: (_) =>
              OrderHistoryCubit(getIt<OrderHistoryRepoImpl>())
                ..getOrderHistory(),
        ),
        BlocProvider(
          create: (context) =>
              FavProductsCubit(getIt<HomeRepoImpl>())..getFavProducts(),
        ),
      ],
      child: const _MainLayoutView(),
    );
  }
}

class _MainLayoutView extends StatefulWidget {
  const _MainLayoutView();

  @override
  State<_MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<_MainLayoutView> {
  int _currentIndex = 0;

  final List<MainTabItem> _tabs = [
    MainTabItem(
      label: LocaleKeys.home.tr(),
      icon: Icons.home,
      screen: HomeView(),
    ),
    MainTabItem(
      label: LocaleKeys.cart.tr(),
      stack: true,
      icon: Icons.shopping_cart_outlined,
      screen: CartView(),
    ),
    MainTabItem(
      label: LocaleKeys.favorites.tr(),
      icon: Icons.favorite,
      screen: FavoritesView(),
    ),
    MainTabItem(
      label: LocaleKeys.order_history.tr(),
      icon: Icons.fastfood_outlined,
      screen: OrderHistoryView(),
    ),
    MainTabItem(
      label: LocaleKeys.setting.tr(),
      icon: Icons.settings_suggest,
      screen: SettingsView(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs.map((e) => e.screen).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.textSecondary,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: List.generate(
          _tabs.length,
          (index) => BottomNavigationBarItem(
            label: _tabs[index].label,
            icon: CustomBarLayout(
              currentIndex: _currentIndex,
              index: index,
              icon: _tabs[index].icon,
              stack: _tabs[index].stack,
            ),
          ),
        ),
      ),
    );
  }
}

class MainTabItem {
  final String label;
  final Widget screen;
  final bool? stack;
  final IconData? icon;

  const MainTabItem({
    required this.label,
    required this.screen,
    this.stack,
    this.icon,
  });
}
