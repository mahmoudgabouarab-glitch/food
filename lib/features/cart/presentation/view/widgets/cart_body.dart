import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/order/presentation/view/order_view.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBtnNavBar(
        text: 'Checkout',
        ontap: () => context.push(const OrderView()),
        title: '\$15.2',
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 12.h),
              child: Card(
                color: AppColor.primary,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          //ProductItemStack(width: 120.w),
                          const Text("dkfldsata\nvrtrvtrtr"),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Btn(
                                ontap: () {},
                                radius: 15,
                                text: "-",
                                minWidth: 0,
                                color: AppColor.error,
                              ),
                              SizedBox(width: 20.w),
                              const Text("1"),
                              SizedBox(width: 20.w),
                              Btn(
                                ontap: () {},
                                radius: 15,
                                text: "+",
                                minWidth: 0,
                                color: AppColor.success,
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Btn(
                            ontap: () {},
                            radius: 15,
                            text: "Remove",
                            color: AppColor.error,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
