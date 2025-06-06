import 'package:complycentre_app/constants/data.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/business_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BusinessPage extends ConsumerWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCard(
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
                  iconWidget: Icon(Icons.add, size: 16.r, color: Colors.white),
                  label: 'Add business',
                  labelStyle: AppTextStyles.statusText(
                    context,
                  ).copyWith(color: Colors.white),
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
                      address: business.address,
                      teamCount: business.teamCount,
                      imageUrl: business.imageUrl,
                      onTileTap: () {
                        context.pushNamed(AppRoute.businessDetail.name);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
    );
  }
}
