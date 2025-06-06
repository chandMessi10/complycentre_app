import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/business_management/presentation/ui/business_page.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/pages/home_page.dart';
import 'package:complycentre_app/features/report_template/presentation/ui/template_page.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> pages = [HomePage(), UserPage(), BusinessPage(), TemplatePage()];
  List<String> pageTitles = [
    "",
    "User management",
    "Business management",
    "Report Templates",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // AppBar background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 102.h,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectedIndex == 0
                        ? Row(
                            children: [
                              Text(
                                'Hi,',
                                style: AppTextStyles.h3(
                                  context,
                                ).copyWith(color: Colors.white),
                              ),
                              sizedBoxWidth(4.w),
                              Text(
                                'Rojan',
                                style: AppTextStyles.h2(
                                  context,
                                ).copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        : Text(
                            pageTitles[selectedIndex],
                            style: AppTextStyles.h3(
                              context,
                            ).copyWith(color: Colors.white),
                          ),

                    Row(
                      spacing: 8.w,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notification.svg',
                          width: 24.r,
                          height: 24.r,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        CircleAvatar(radius: 12),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Positioned(
            top: 94.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: pages[selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondaryText,
        selectedLabelStyle: AppTextStyles.caption(context),
        unselectedLabelStyle: AppTextStyles.caption(context),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.home,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcIn),
            ),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              AppAssets.home,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.user,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcIn),
            ),
            label: 'User',
            activeIcon: SvgPicture.asset(
              AppAssets.user,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.briefcase,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcIn),
            ),
            label: 'Business',
            activeIcon: SvgPicture.asset(
              AppAssets.briefcase,
              colorFilter: ColorFilter.mode(
                const Color(0xFF4A90E2),
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.file,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcIn),
            ),
            label: 'Templates',
            activeIcon: SvgPicture.asset(
              AppAssets.file,
              colorFilter: ColorFilter.mode(
                const Color(0xFF4A90E2),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
