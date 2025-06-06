import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    required this.hint,
    required this.controller,
    super.key,
    this.focusNode,
    this.obscurePassword,
    this.validatorFn,
    this.onTapFn,
    this.suffixIcon,
    this.backgroundColor,
    this.keyboardType = TextInputType.text,
    this.isEnabled = true,
  });

  final String hint;
  final bool? obscurePassword;
  final TextEditingController controller;
  final String? Function(String?)? validatorFn;
  final bool isEnabled;
  final VoidCallback? onTapFn;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextInputType keyboardType;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool obscurePassword = false;
  ValueNotifier<bool> isFormFocused = ValueNotifier<bool>(false);

  void changePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  void initState() {
    obscurePassword = widget.obscurePassword ?? false;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.focusNode != null) {
        widget.focusNode!.addListener(() {
          isFormFocused.value = widget.focusNode!.hasFocus ? true : false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFormFocused,
      builder: (context, value, child) => TextFormField(
        enabled: widget.isEnabled,
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: obscurePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validatorFn,
        style: AppTextStyles.bodyText(context),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.white,
          suffixIconConstraints: BoxConstraints(
            maxWidth: 32.w,
            maxHeight: 24.h,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: widget.obscurePassword != null
                ? IconButton(
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: changePasswordVisibility,
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      size: 24.r,
                    ),
                  )
                : widget.suffixIcon,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 9.5.h,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
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

        onTap: widget.onTapFn,
        onTapOutside: (event) {
          widget.focusNode?.unfocus();
        },
      ),
    );
  }
}
