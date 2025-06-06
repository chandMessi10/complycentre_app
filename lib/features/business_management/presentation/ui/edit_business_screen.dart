import 'package:cached_network_image/cached_network_image.dart';
import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_checkbox.dart';
import 'package:complycentre_app/core/custom_widgets/custom_form_field.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/user_management/model/user_model.dart'; // Import UserModel
import 'package:complycentre_app/features/user_management/presentation/ui/user_page.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_role_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EditBusinessScreen extends ConsumerStatefulWidget {
  const EditBusinessScreen({super.key});

  @override
  ConsumerState<EditBusinessScreen> createState() => _EditBusinessScreenState();
}

class _EditBusinessScreenState extends ConsumerState<EditBusinessScreen> {
  final Set<UserModel> _selectedusers = {};

  late TextEditingController _businessNameController;
  late TextEditingController _locationController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _searchUserController;

  late FocusNode _businessNameFocusNode;
  late FocusNode _locationFocusNode;
  late FocusNode _phoneNumberFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _searchUserFocusNode;

  @override
  void initState() {
    super.initState();
    _businessNameController = TextEditingController();
    _locationController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _searchUserController = TextEditingController();

    _businessNameFocusNode = FocusNode();
    _locationFocusNode = FocusNode();
    _phoneNumberFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _searchUserFocusNode = FocusNode();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _businessNameController.text = 'Clean office';
      _locationController.text = '45 Market Lane, New York, NY 10001, USA';
      _phoneNumberController.text = '+1 (415) 555-0132';
      _emailController.text = 'clean@gmail.com';
    });
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _locationController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _searchUserController.dispose();

    _businessNameFocusNode.dispose();
    _locationFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _emailFocusNode.dispose();
    _searchUserFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit business',
          style: AppTextStyles.h3(context).copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CustomCard(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVnfDB8fHx8fA%3D%3D',
                          height: 108.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      sizedBoxHeight(8.h),
                      CustomFilledButton(
                        onBtnPressed: () {},
                        label: 'Change image',
                        backgroundColor: AppColors.background,
                        labelColor: AppColors.secondaryText,
                        labelStyle: AppTextStyles.h3(
                          context,
                        ).copyWith(color: AppColors.secondaryText),
                      ),
                      sizedBoxHeight(24.h),
                      CustomFormField(
                        hint: 'Business name',
                        controller: _businessNameController,
                        focusNode: _businessNameFocusNode,
                        backgroundColor: AppColors.primaryLight,
                      ),
                      sizedBoxHeight(16.h),
                      CustomFormField(
                        hint: 'Location',
                        controller: _locationController,
                        focusNode: _locationFocusNode,
                        backgroundColor: AppColors.primaryLight,
                        suffixIcon: SvgPicture.asset(AppAssets.locationIcon),
                      ),
                      sizedBoxHeight(16.h),
                      CustomFormField(
                        hint: 'Phone Number',
                        controller: _phoneNumberController,
                        focusNode: _phoneNumberFocusNode,
                        backgroundColor: AppColors.primaryLight,
                        keyboardType: TextInputType.phone,
                      ),
                      sizedBoxHeight(16.h),
                      CustomFormField(
                        hint: 'Email address',
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        backgroundColor: AppColors.primaryLight,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      sizedBoxHeight(24.h),
                      Text('Assigned user', style: AppTextStyles.h3(context)),
                      sizedBoxHeight(16.h),
                      CustomFormField(
                        hint: 'Search user',
                        controller: _searchUserController,
                        focusNode: _searchUserFocusNode,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.name,
                                      style: AppTextStyles.caption(context),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          user.email,
                                          style: AppTextStyles.caption(context)
                                              .copyWith(
                                                color: AppColors.secondaryText,
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
                      sizedBoxHeight(24.h),
                      SizedBox(
                        width: double.infinity,
                        child: CustomFilledButton(
                          onBtnPressed: () {},
                          label: 'Save changes',
                          iconWidget: SvgPicture.asset(
                            AppAssets.saveIcon,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      sizedBoxHeight(24.h),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Center(
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
        ],
      ),
    );
  }
}
