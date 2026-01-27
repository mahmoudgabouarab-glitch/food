import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/features/home/data/model/cart/add_to_cart_request.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/presentation/view/widgets/details/add_to_cart_listener.dart';
import 'package:food/features/home/presentation/view/widgets/details/details_slider.dart';
import 'package:food/features/home/presentation/view/widgets/details/side_options_list_view.dart';
import 'package:food/features/home/presentation/view/widgets/details/topping_list_view.dart';
import 'package:food/features/home/presentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/side_options_cubit/side_options_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/toppings_cubit/toppings_cubit.dart';

class DetailsBody extends StatelessWidget {
  final ListOfProducts products;
  const DetailsBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double spicy = 0.5;
    return Scaffold(
      bottomNavigationBar: CustomBtnNavBar(
        text: 'Add To Cart',
        ontap: () {
          context.read<AddToCartCubit>().addToCart(
            AddToCartItem(
              productId: products.id,
              quantity: 1,
              spicy: spicy,
              toppings: context.read<ToppingsCubit>().selectedToppingIds,
              sideOptions: context
                  .read<SideOptionsCubit>()
                  .selectedsideOptionsIds,
            ),
          );
        },
        title: '\$54.1',
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsSlider(
                products: products,
                onChanged: (double value) {
                  spicy = value;
                },
              ),
              spaceH(50),
              const Text("Toppings"),
              spaceH(10),
              const ToppingListView(),
              spaceH(50),
              const Text("SideOptions"),
              spaceH(10),
              const SideOptionsListView(),
              const AddToCartListener(),
            ],
          ),
        ),
      ),
    );
  }
}
