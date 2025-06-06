import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_checkbox.dart';
import 'package:complycentre_app/core/custom_widgets/custom_form_field.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/user_management/model/user_model.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/user_page.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_role_chip.dart';
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
  final Set<UserModel> _selectedusers = {};
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
              child: CustomCard(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          keyboardType: TextInputType.phone,
                        ),
                        sizedBoxHeight(16.h),
                        CustomFormField(
                          hint: 'Email address',
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        sizedBoxHeight(16.h),
                        Text('Assign users', style: AppTextStyles.h3(context)),
                        sizedBoxHeight(16.h),
                        CustomFormField(
                          hint: 'Search user',
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: AppColors.tertiary,
                          ),
                        ),
                        sizedBoxHeight(16.h),
                        SizedBox(
                          height: 160.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: dummyUsers.length,
                            separatorBuilder: (context, index) =>
                                sizedBoxHeight(16.h),
                            itemBuilder: (context, index) {
                              final user = dummyUsers[index];
                              return Row(
                                children: [
                                  CustomFilledCheckbox(
                                    value: _selectedusers.contains(user),
                                    onChanged: (bool? isChecked) {
                                      setState(() {
                                        if (isChecked == true) {
                                          _selectedusers.add(user);
                                        } else {
                                          _selectedusers.remove(user);
                                        }
                                      });
                                    },
                                    size: 16,
                                  ),
                                  sizedBoxWidth(8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.name,
                                        style: AppTextStyles.caption(context),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            user.email,
                                            style:
                                                AppTextStyles.caption(
                                                  context,
                                                ).copyWith(
                                                  color:
                                                      AppColors.secondaryText,
                                                ),
                                          ),
                                          sizedBoxWidth(4.w),
                                          UserRoleChip(role: user.role),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        sizedBoxHeight(16.h),
                        SizedBox(
                          width: double.infinity,
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              radius: Radius.circular(8.r),
                              color: AppColors.borderColor,
                              padding: EdgeInsets.all(24.r),
                            ),
                            child: Center(
                              child: Column(
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

                                        iconWidget: SvgPicture.asset(
                                          AppAssets.uploadIcon,
                                          colorFilter: ColorFilter.mode(
                                            AppColors.secondaryText,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        label: 'Upload image',
                                        labelColor: AppColors.secondaryText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        sizedBoxHeight(24.h),
                        SizedBox(
                          width: double.infinity,
                          child: CustomFilledButton(
                            onBtnPressed: () {},
                            iconWidget: Icon(Icons.add_rounded),
                            label: 'Create business',
                          ),
                        ),
                        sizedBoxHeight(20.h),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
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
                        ),
                        sizedBoxHeight(32.h),
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
