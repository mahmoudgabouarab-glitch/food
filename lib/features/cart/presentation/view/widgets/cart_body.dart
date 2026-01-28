import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/cart/presentation/view/widgets/cart_appbar.dart';
import 'package:food/features/cart/presentation/view/widgets/cart_navgations_bar.dart';
import 'package:food/features/cart/presentation/view/widgets/one_item_of_cart.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoading) {
          return const CustomLoading(size: 20);
        } else if (state is CartSuccess) {
          return Scaffold(
            appBar: CartAppBar(state: state),
            bottomNavigationBar: CartNavgationBar(
              item: state.getCartResponse.data,
            ),
            body: Padding(
              padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 12.h),
              child: ListView.builder(
                itemCount: state.getCartResponse.data.items.length,
                itemBuilder: (context, index) {
                  return OneItemOfCart(
                    item: state.getCartResponse.data.items[index],
                  );
                },
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
