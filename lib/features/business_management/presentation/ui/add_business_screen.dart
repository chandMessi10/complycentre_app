import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/custom_form_field.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddBusinessScreen extends ConsumerStatefulWidget {
  const AddBusinessScreen({super.key});

  @override
  ConsumerState<AddBusinessScreen> createState() => _AddBusinessScreenState();
}

class _AddBusinessScreenState extends ConsumerState<AddBusinessScreen> {
  late TextEditingController _businessNameController;
  late TextEditingController _locationController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _assignedUserController;

  late FocusNode _businessNameFocusNode;
  late FocusNode _locationFocusNode;
  late FocusNode _phoneNumberFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _assignedUserFocusNode;

  @override
  void initState() {
    _businessNameController = TextEditingController();
    _locationController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _assignedUserController = TextEditingController();

    _businessNameFocusNode = FocusNode();
    _locationFocusNode = FocusNode();
    _phoneNumberFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _assignedUserFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _locationController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _assignedUserController.dispose();

    _businessNameFocusNode.dispose();
    _locationFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _emailFocusNode.dispose();
    _assignedUserFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create new business',
          style: AppTextStyles.h3(context).copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: DashboardCard(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        CustomFormField(
                          hint: 'Business name',
                          controller: _businessNameController,
                          focusNode: _businessNameFocusNode,
                        ),
                        sizedBoxHeight(16.h),
                        CustomFormField(
                          hint: 'Location',
                          controller: _locationController,
                          focusNode: _locationFocusNode,
                          suffixIcon: SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                              AppAssets.locationIcon,
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                        sizedBoxHeight(16.h),
                        CustomFormField(
                          hint: 'Phone number',
                          controller: _phoneNumberController,
                          focusNode: _phoneNumberFocusNode,
                        ),
                        sizedBoxHeight(16.h),
                        CustomFormField(
                          hint: 'Email address',
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                        ),
                        sizedBoxHeight(16.h),
                        CustomFormField(
                          hint: 'Assigned user',
                          controller: _assignedUserController,
                          focusNode: _assignedUserFocusNode,
                          isEnabled:
                              false, // Assuming this will be a dropdown or selection
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                        ),
                        sizedBoxHeight(16.h),
                        DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            radius: Radius.circular(8.r),
                            color: AppColors.borderColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Upload image',
                                  style: AppTextStyles.h3(context),
                                ),
                                sizedBoxHeight(4.h),
                                Text(
                                  'Add a visual representation of your business.',
                                  style: AppTextStyles.bodyText(
                                    context,
                                  ).copyWith(color: AppColors.secondaryText),
                                ),
                                sizedBoxHeight(24.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomFilledButton(
                                      onBtnPressed: () {},
                                      backgroundColor: Color(0xffEBEBEB),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppAssets.uploadIcon,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.secondaryText,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          sizedBoxWidth(8.w),
                                          Text(
                                            'Upload image',
                                            style: AppTextStyles.h3(context)
                                                .copyWith(
                                                  color:
                                                      AppColors.secondaryText,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        sizedBoxHeight(24.h),
                        CustomFilledButton(
                          onBtnPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_rounded),
                              Text(
                                'Create business',
                                style: AppTextStyles.h3(
                                  context,
                                ).copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxHeight(20.h),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.h3(
                              context,
                            ).copyWith(color: AppColors.brandText),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
