import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/features/home/data/model/cart/add_to_cart_request.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/presentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/side_options_cubit/side_options_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/slider_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/toppings_cubit/toppings_cubit.dart';

class DetailsActions extends StatelessWidget {
  final ListOfProducts products;
  const DetailsActions({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return CustomBtnNavBar(
      ontap: () {
        context.read<AddToCartCubit>().addToCart(
          AddToCartItem(
            productId: products.id,
            quantity: 1,
            spicy: context.read<SpicyCubit>().state,
            toppings: context.read<ToppingsCubit>().selectedToppingIds,
            sideOptions: context
                .read<SideOptionsCubit>()
                .selectedsideOptionsIds,
          ),
        );
      },
      title: '\$54.1',
      child: Text(
        "Add to cart",
        style: Styles.s16_500.copyWith(color: Colors.white),
      ),
    );
  }
}
