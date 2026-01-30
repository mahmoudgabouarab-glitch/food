import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class OrderBody extends StatefulWidget {
  final double totalPrice;
  const OrderBody({super.key, required this.totalPrice});

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBtnNavBar(
        text: "Pay Now",
        ontap: () {},
        title: "\$${widget.totalPrice + 15 + 5}",
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: const Text("Order Summary"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              spaceH(15),
              _buildRowOrder("Order", "\$${widget.totalPrice}"),
              _buildRowOrder("Tax", "\$15"),
              _buildRowOrder("Delivery", "\$5"),
              const Divider(),
              spaceH(20),
              _buildRowOrder("Total", "\$${widget.totalPrice + 15 + 5}"),
              spaceH(10),
              _buildRowOrder("Estimated delivery time", "15 - 30 mins"),
              spaceH(40),
              const Text("Payment methods"),
              spaceH(20),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "assets/image/dollarbackgroundremoved.png",
                    width: 100.w,
                  ),
                  title: const Text("Cash on Delivery"),
                  trailing: Checkbox(
                    value: isSelected,
                    checkColor: AppColor.textPrimary,
                    activeColor: AppColor.primary,
                    onChanged: (val) {
                      setState(() {
                        isSelected = val!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 27.h),
              _buildVisaCard(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildRowOrder(String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    ),
  );
}

Widget _buildVisaCard() {
  return BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) {
      if (state is ProfileSuccess) {
        final visa = state.profilemodel.data.visa;
        if (visa == null || visa.isEmpty) {
          return const SizedBox.shrink();
        }
        return Card(
          child: ListTile(
            leading: Image.asset("assets/image/visa.png", width: 100.w),
            title: const Text("Debit card"),
            subtitle: Text(visa),
          ),
        );
      }

      return const SizedBox.shrink();
    },
  );
}
