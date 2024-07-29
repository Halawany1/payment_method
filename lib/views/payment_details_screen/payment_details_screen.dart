import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/component/custom_button.dart';
import 'package:payment/views/payment_details_screen/widget/custom_credit_card.dart';
import 'package:payment/views/payment_details_screen/widget/payment_method_items.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    var fontStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment Details',
          style: fontStyle.displayLarge,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: BuildPaymentMethodItems(),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              autoValidateMode: autoValidateMode,
              formKey: formKey,
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 15.h,
                  left: 8.w,
                  right: 8.w,
                ),
                child: CustomButton(
                  text: 'Pay',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
