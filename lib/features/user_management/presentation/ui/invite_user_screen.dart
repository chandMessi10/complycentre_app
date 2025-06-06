import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/constants/data.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/custom_form_field.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class InviteUserScreen extends ConsumerStatefulWidget {
  const InviteUserScreen({super.key});

  @override
  ConsumerState<InviteUserScreen> createState() => _InviteUserScreenState();
}

class _InviteUserScreenState extends ConsumerState<InviteUserScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _roleController;
  late TextEditingController _businessController;
  late FocusNode _emailFocusNode;
  late FocusNode _nameFocusNode;
  final GlobalKey _roleGlobalKey = GlobalKey();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _roleController = TextEditingController();
    _businessController = TextEditingController();
    _emailFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    _businessController.dispose();
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Invite new user',
          style: AppTextStyles.h3(context).copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: CustomCard(
          child: Column(
            children: [
              UserAvatar(isTappable: true, onTapFn: () {}),
              sizedBoxHeight(24.h),
              Form(
                child: Column(
                  children: [
                    CustomFormField(
                      hint: 'Name',
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                    ),
                    sizedBoxHeight(16.h),
                    CustomFormField(
                      hint: 'Email address',
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    sizedBoxHeight(16.h),
                    GestureDetector(
                      onTapDown: (details) =>
                          _showRolesDropDown(context, details),
                      child: CustomFormField(
                        key: _roleGlobalKey,
                        hint: 'Role',
                        controller: _roleController,
                        isEnabled: false,
                        suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                    ),
                    sizedBoxHeight(16.h),
                    CustomFormField(
                      hint: 'Assigned business',
                      controller: _businessController,
                    ),
                    sizedBoxHeight(24.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomFilledButton(
                        onBtnPressed: () {},
                        iconWidget: SvgPicture.asset(
                          AppAssets.addUserIcon,
                          height: 24.h,
                          width: 24.h,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Invite user',
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
            ],
          ),
        ),
      ),
    );
  }
}
