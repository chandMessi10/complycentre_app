import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/user_tile.dart';
import 'package:complycentre_app/features/user_management/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final List<UserModel> dummyUsers = [
  UserModel(
    name: 'Sonam khatri',
    email: 'sonam@gmail.com',
    role: 'Cleaner',
    isActive: true,
    avatarUrl: null,
  ),
  UserModel(
    name: 'Sonam khatri',
    email: 'sonam@gmail.com',
    role: 'Cleaner',
    isActive: true,
    avatarUrl: null,
  ),
  UserModel(
    name: 'Sonam khatri',
    email: 'sonam@gmail.com',
    role: 'Cleaner',
    isActive: true,
    avatarUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  UserModel(
    name: 'Vision Thapa',
    email: 'vision@gmail.com',
    role: 'Supervisor',
    isActive: false,
    avatarUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DashboardCard(
      child:
          //  EmptyUserWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16.h,
            children: [
              SizedBox(
                height: 36.h,
                child: CustomFilledButton(
                  onBtnPressed: () {
                    context.pushNamed(AppRoute.inviteUser.name);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_rounded, size: 16.r, color: Colors.white),
                      sizedBoxWidth(8.w),
                      Text(
                        'Invite user ',
                        style: AppTextStyles.statusText(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: dummyUsers.length,
                  separatorBuilder: (context, index) => sizedBoxHeight(16.h),
                  itemBuilder: (context, index) {
                    final user = dummyUsers[index];
                    return UserTile(
                      name: user.name,
                      email: user.email,
                      role: user.role,
                      isActive: user.isActive,
                      avatarUrl: user.avatarUrl,
                    );
                  },
                ),
              ),
            ],
          ),
    );
  }
}
