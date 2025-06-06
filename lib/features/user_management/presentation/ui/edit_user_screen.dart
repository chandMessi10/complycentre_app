import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/constants/data.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_checkbox.dart';
import 'package:complycentre_app/core/custom_widgets/custom_form_field.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/business_management/domain/model/business.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EditUserScreen extends ConsumerStatefulWidget {
  const EditUserScreen({super.key});

  @override
  ConsumerState<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends ConsumerState<EditUserScreen> {
  final GlobalKey _roleGlobalKey = GlobalKey();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _roleController;

  final Set<Business> _selectedBusinesses = {};

  void _showRolesDropDown(BuildContext context, TapDownDetails details) {
    final RenderBox renderBox =
        _roleGlobalKey.currentContext!.findRenderObject() as RenderBox;
    final Offset textFieldOffset = renderBox.localToGlobal(Offset.zero);
    final Size textFieldSize = renderBox.size;

    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        textFieldOffset.dx,
        textFieldOffset.dy - 16.h + textFieldSize.height,
        overlay.size.width - textFieldOffset.dx,
        overlay.size.height - (textFieldOffset.dy + textFieldSize.height),
      ),
      constraints: BoxConstraints(
        minWidth: textFieldSize.width,
        maxWidth: textFieldSize.width,
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      elevation: 4,
      menuPadding: EdgeInsets.all(4),
      shadowColor: AppColors.primaryText.withAlpha(30),
      items: roles.map((role) {
        return PopupMenuItem<String>(
          height: 24.h,
          onTap: () {
            _roleController.text = role;
          },
          value: role,
          child: Text(
            role,
            style: AppTextStyles.caption(
              context,
            ).copyWith(color: AppColors.secondaryText),
          ),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _roleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit user',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UserAvatar(isTappable: true, onTapFn: () {}),
                      sizedBoxHeight(24.h),
                      CustomFormField(
                        hint: 'Sonam khatri',
                        controller: _nameController,
                        focusNode: FocusNode(),
                        backgroundColor: AppColors.primaryLight,
                      ),
                      sizedBoxHeight(16.h),
                      CustomFormField(
                        hint: 'clean@gmail.com',
                        controller: _emailController,
                        focusNode: FocusNode(),
                        backgroundColor: AppColors.primaryLight,
                      ),
                      sizedBoxHeight(16.h),
                      GestureDetector(
                        onTapDown: (details) =>
                            _showRolesDropDown(context, details),
                        child: CustomFormField(
                          key: _roleGlobalKey,
                          hint: 'Cleaner',
                          controller: _roleController,
                          isEnabled: false,
                          backgroundColor: AppColors.primaryLight,
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                          ),
                        ),
                      ),
                      sizedBoxHeight(24.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Assigned Business',
                          style: AppTextStyles.h3(context),
                        ),
                      ),
                      sizedBoxHeight(16.h),
                      CustomFormField(
                        hint: 'Search business',
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: AppColors.tertiary,
                        ),
                      ),
                      sizedBoxHeight(16.h),
                      SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              sizedBoxHeight(16.h),
                          itemBuilder: (context, index) {
                            final business = dummyBusinesses[index];
                            return Row(
                              children: [
                                CustomFilledCheckbox(
                                  value: _selectedBusinesses.contains(business),
                                  onChanged: (bool? isChecked) {
                                    setState(() {
                                      if (isChecked == true) {
                                        _selectedBusinesses.add(business);
                                      } else {
                                        _selectedBusinesses.remove(business);
                                      }
                                    });
                                  },
                                  size: 24,
                                ),
                                sizedBoxWidth(8.w),
                                Text(
                                  business.officeName,
                                  style: AppTextStyles.caption(context),
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
                      sizedBoxHeight(16.h),
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
