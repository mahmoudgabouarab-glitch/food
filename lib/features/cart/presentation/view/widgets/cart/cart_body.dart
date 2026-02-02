import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/cart/presentation/view/widgets/cart/cart_appbar.dart';
import 'package:food/features/cart/presentation/view/widgets/cart/one_item_of_cart.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        switch (state) {
          case CartInitial():
          case CartLoading():
            return const CustomLoading(size: 20);
          case CartSuccess():
            return _buildCarBody(state, context);
          case CartFailure():
            return Center(child: Text(state.err));
        }
      },
    );
  }
}

Widget _buildCarBody(CartSuccess state, BuildContext context) {
  return Scaffold(
    appBar: CartAppBar(item: state.getCartResponse.data),
    body: Padding(
      padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 12.h),
      child: RefreshIndicator(
        color: AppColor.btn,
        displacement: 60,
        onRefresh: () => context.read<CartCubit>().getCart(),
        child: ListView.builder(
          itemCount: state.getCartResponse.data.items.length,
          itemBuilder: (context, index) {
            return OneItemOfCart(item: state.getCartResponse.data.items[index]);
          },
        ),
      ),
    ),
  );
}
