import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/features/home/presentation/view/widgets/details/details_slider.dart';
import 'package:food/features/home/presentation/view/widgets/details/side_options_list_view.dart';
import 'package:food/features/home/presentation/view/widgets/details/topping_list_view.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBtnNavBar(
        text: 'Add To Cart',
        ontap: () {},
        title: '\$54.1',
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailsSlider(),
              SizedBox(height: 50.h),
              const Text("Toppings"),
              SizedBox(height: 10.h),
              const ToppingListView(),
              SizedBox(height: 50.h),
              const Text("SideOptions"),
              SizedBox(height: 10.h),
              const SideOptionsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
