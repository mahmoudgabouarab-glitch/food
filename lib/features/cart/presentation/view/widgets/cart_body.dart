import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/cart/presentation/view/widgets/cart_item_stack.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:food/features/cart/presentation/view_model/remove_cart_cubit/remove_cart_cubit.dart';
import 'package:food/features/order/presentation/view/order_view.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is CartSuccess
            ? Scaffold(
                bottomNavigationBar: CustomBtnNavBar(
                  text: 'Checkout',
                  ontap: () => context.push(const OrderView()),
                  title: '\$${state.getCartResponse.data.totalPrice}',
                ),
                body: SafeArea(
                  child: ListView.builder(
                    itemCount: state.getCartResponse.data.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cubit = state.getCartResponse.data.items[index];
                      final top = cubit.toppings.isEmpty
                          ? ""
                          : cubit.toppings.map((e) => e.name).join(', ');
                      final side = cubit.sideOptions.isEmpty
                          ? ""
                          : cubit.sideOptions.map((e) => e.name).join(', ');
                      return Padding(
                        padding: EdgeInsets.only(
                          right: 12.w,
                          left: 12.w,
                          top: 12.h,
                        ),
                        child: Card(
                          color: AppColor.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    CartItemStack(imageUrl: cubit.image),
                                    Text(
                                      "${cubit.name}\n${cubit.price}\n$side\n$top",
                                    ),
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
                                        Text("${cubit.quantity}"),
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
                                      ontap: () {
                                        context
                                            .read<RemoveCartCubit>()
                                            .removeCart(
                                              id: cubit.itemId.toString(),
                                            );
                                      },
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
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
