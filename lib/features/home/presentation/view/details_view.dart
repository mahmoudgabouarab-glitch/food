import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/data/repo/home_repo_impl.dart';
import 'package:food/features/home/presentation/view/widgets/details/details_body.dart';
import 'package:food/features/home/presentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/side_options_cubit/side_options_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/slider_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/toppings_cubit/toppings_cubit.dart';

class DetailsView extends StatelessWidget {
  final ListOfProducts products;
  const DetailsView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ToppingsCubit(getIt<HomeRepoImpl>())..getToppings(),
        ),
        BlocProvider(
          create: (context) =>
              SideOptionsCubit(getIt<HomeRepoImpl>())..getSideOptions(),
        ),
        BlocProvider(
          create: (context) => AddToCartCubit(getIt<HomeRepoImpl>()),
        ),
        BlocProvider(create: (context) => SpicyCubit()),
      ],
      child: DetailsBody(products: products),
    );
  }
}
