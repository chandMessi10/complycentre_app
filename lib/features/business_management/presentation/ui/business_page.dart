import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/business_management/domain/model/business.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/business_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final List<Business> dummyBusinesses = [
  Business(
    officeName: 'Office name',
    locationCount: 2,
    teamCount: 3,
    imageUrl: null,
  ),
  Business(
    officeName: 'Office name',
    locationCount: 2,
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1504384308090-c899fd125b88?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Business(
    officeName: 'Office name',
    locationCount: 2,
    teamCount: 3,
    imageUrl: null,
  ),
  Business(
    officeName: 'Office name',
    locationCount: 2,
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1509062272845-97c6660659f2?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Business(
    officeName: 'Office name',
    locationCount: 2,
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Business(
    officeName: 'Office name',
    locationCount: 2,
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];

class BusinessPage extends ConsumerWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DashboardCard(
      child:
          // EmptyBusinessWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16.h,
            children: [
              SizedBox(
                height: 36.h,
                child: CustomFilledButton(
                  onBtnPressed: () {
                    context.pushNamed(AppRoute.addBusiness.name);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 16.r, color: Colors.white),
                      sizedBoxWidth(8.w),
                      Text(
                        'Add business',
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
                  itemCount: dummyBusinesses.length,
                  separatorBuilder: (context, index) => sizedBoxHeight(16.h),
                  itemBuilder: (context, index) {
                    final business = dummyBusinesses[index];
                    return BusinessTile(
                      officeName: business.officeName,
                      locationCount: business.locationCount,
                      teamCount: business.teamCount,
                      imageUrl: business.imageUrl,
                    );
                  },
                ),
              ),
            ],
          ),
    );
  }
}
