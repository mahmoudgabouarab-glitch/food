import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';

class OrderBody extends StatelessWidget {
  final double totalPrice;
  const OrderBody({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBtnNavBar(
        text: "Pay Now",
        ontap: () {},
        title: "\$18.2",
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              spaceH(18),
              const Text("Order summary"),
              spaceH(15),
              _buildRowOrder("Order", "\$$totalPrice"),
              _buildRowOrder("Tax", "\$15"),
              _buildRowOrder("Delivery", "\$5"),
              const Divider(),
              spaceH(20),
              _buildRowOrder("Total", "\$165"),
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
                  trailing: Checkbox(value: false, onChanged: (val) {}),
                ),
              ),
              SizedBox(height: 27.h),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/image/visa.png", width: 100.w),
                  title: const Text("Debit card"),
                  subtitle: const Text("3566 **** **** 0505"),
                ),
              ),
              SizedBox(height: 16.h),
              CheckboxListTile(
                value: false,
                onChanged: (val) {},
                title: const Text("Save card details for future payments"),
              ),
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
