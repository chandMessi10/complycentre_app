import 'dart:developer';

import 'package:complycentre_app/core/custom_widgets/custom_form_field.dart';
import 'package:complycentre_app/core/extensions/build_context_extensions.dart';
import 'package:complycentre_app/core/mixins/input_validation_mixins.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Text("LOGO", style: AppTextStyles.h1(context)),
              ),
            ),
            Container(
              height: 580.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome to Complycenter',
                    style: AppTextStyles.h2(context),
                  ),
                  sizedBoxHeight(8.h),
                  Text(
                    'Enter your details below',
                    style: AppTextStyles.bodyText(
                      context,
                    ).copyWith(color: AppColors.secondaryText),
                  ),
                  sizedBoxHeight(32.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          controller: _emailController,
                          hint: 'Email',
                          validatorFn: emailValidator,
                        ),
                        sizedBoxHeight(16.h),
                        CustomFormField(
                          controller: _passwordController,
                          hint: 'Password',
                          obscurePassword: true,
                          validatorFn: passwordValidator,
                        ),
                        sizedBoxHeight(24.h),
                        FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              AppColors.primary,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(width: double.infinity),
                              ),
                            ),
                            fixedSize: WidgetStateProperty.all<Size>(
                              Size(context.mqSize.width, 40.h),
                            ),
                          ),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {}
                            log('email: ${_emailController.text.trim()}');
                            log('password: ${_passwordController.text.trim()}');
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

