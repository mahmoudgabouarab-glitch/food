import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/data/model/order_model/order_request.dart';
import 'package:food/features/cart/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:food/features/cart/presentation/view_model/stripe_cubit/payment_method_cubit.dart';
import 'package:food/features/cart/presentation/view_model/stripe_cubit/stripe_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class OrderAction extends StatelessWidget {
  final double totalPrice;
  final List<CartItem> cartItems;
  const OrderAction({
    super.key,
    required this.totalPrice,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StripeCubit, StripeState>(
      builder: (context, state) {
        return CustomBtnNavBar(
          ontap: state is StripeLoading
              ? null
              : () async {
                  final items = cartItems
                      .map((item) => OrderItem.fromCartItem(item))
                      .toList();
                  final payment = context.read<PaymentCubit>().state;
                  final cubitOrder = context.read<OrderCubit>();
                  final cubitStripe = context.read<StripeCubit>();
                  switch (payment) {
                    case PaymentMethod.none:
                      return CustomSnackBar.show(
                        context,
                        message: "Please select payment way",
                        type: SnackBarType.error,
                      );
                    case PaymentMethod.cash:
                      return cubitOrder.postOrder(items);
                    case PaymentMethod.visa:
                      await cubitStripe.payment(
                        amount: totalPrice.toInt() + 15 + 5,
                      );
                      final stripeState = cubitStripe.state;
                      if (stripeState is StripeSuccess) {
                        await cubitOrder.postOrder(items);
                      }
                  }
                },
          title: "\$${totalPrice + 15 + 5}",
          child: state is StripeLoading
              ? const CupertinoActivityIndicator(color: AppColor.btn)
              : Text(LocaleKeys.checkout.tr()),
        );
      },
    );
  }
}
