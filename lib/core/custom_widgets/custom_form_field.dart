import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.hint,
    this.obscurePassword,
    required this.controller,
    this.validatorFn,
  });

  final String hint;
  final bool? obscurePassword;
  final TextEditingController controller;
  final String? Function(String?)? validatorFn;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool obscurePassword = false;
  void changePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    obscurePassword = widget.obscurePassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscurePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validatorFn,
      decoration: InputDecoration(
        suffixIcon: widget.obscurePassword != null
            ? IconButton(
                onPressed: changePasswordVisibility,
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.5.h),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.danger),
          borderRadius: BorderRadius.circular(8.r),
        ),
        hintText: widget.hint,
        hintStyle: AppTextStyles.bodyText(
          context,
        ).copyWith(color: AppColors.tertiary),
      ),
    );
  }
}
