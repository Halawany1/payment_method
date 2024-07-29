import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/component/custom_button.dart';

import '../payment_details_screen/payment_details_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var fontStyle = Theme.of(context).textTheme;
    List<String> items = [
      'Order Subtotal',
      'Discount',
      'Discount',
    ];
    List<String> price = [
      r'$42.27',
      r'$1',
      r'$8',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: fontStyle.displayLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/cart.png'),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[index],
                    style: fontStyle.displayLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    price[index],
                    style: fontStyle.displayLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 5.h,
              ),
              itemCount: items.length,
            ),
            Divider(
              thickness: 2.h,
              height: 20.h,
              color: const Color(0xFFC6C6C6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: fontStyle.displayLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  r'$50.97',
                  style: fontStyle.displayLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentDetailsScreen(),
                  ),
                );
              },
              text: 'Complete Payment',
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
