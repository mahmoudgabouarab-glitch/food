import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/presentation/view/widgets/details/add_to_cart_listener.dart';
import 'package:food/features/home/presentation/view/widgets/details/details_actions.dart';
import 'package:food/features/home/presentation/view/widgets/details/details_slider.dart';
import 'package:food/features/home/presentation/view/widgets/details/side_options_list_view.dart';
import 'package:food/features/home/presentation/view/widgets/details/topping_list_view.dart';

class DetailsBody extends StatelessWidget {
  final ListOfProducts products;
  const DetailsBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double spicy = 0.5;
    return Scaffold(
      bottomNavigationBar: DetailsActions(products: products, spicy: spicy),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsSlider(
                products: products,
                onChanged: (double value) {
                  spicy = value;
                },
              ),
              spaceH(20),
              const Text("Toppings"),
              spaceH(10),
              const ToppingListView(),
              spaceH(20),
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
