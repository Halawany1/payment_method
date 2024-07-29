import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var fontStyle = Theme.of(context).textTheme;
    return MaterialButton(
      minWidth: double.infinity,
      height: 60.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      color: const Color(0xFF34A853),
      onPressed: onPressed,
      child: Text(
        text,
        style: fontStyle.displayLarge!.copyWith(
          fontSize: 22.sp,
        ),
      ),
    );
  }
}
