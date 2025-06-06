import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/report_template/model/template_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../dashboard/presentation/ui/widgets/template_card.dart'; // Import the TemplateCard widget

final List<TemplateModel> dummyTemplates = [
  TemplateModel(
    templateName: 'School cleaning',
    lastUpdated: '2 month ago',
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  TemplateModel(
    templateName: 'School cleaning',
    lastUpdated: '2 month ago',
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  TemplateModel(
    templateName: 'School cleaning',
    lastUpdated: '2 month ago',
    imageUrl: null, // For initials
  ),
  TemplateModel(
    templateName: 'School cleaning',
    lastUpdated: '2 month ago',
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  TemplateModel(
    templateName: 'School cleaning',
    lastUpdated: '2 month ago',
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  TemplateModel(
    templateName: 'School cleaning',
    lastUpdated: '2 month ago',
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];

class TemplatePage extends ConsumerWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 16.h,
        children: [
          SizedBox(
            height: 36.h,
            child: CustomFilledButton(
              onBtnPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 16.r, color: Colors.white),
                  sizedBoxWidth(8.w),
                  Text(
                    'Create report',
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
              itemCount: dummyTemplates.length,
              separatorBuilder: (context, index) => sizedBoxHeight(16.h),
              itemBuilder: (context, index) {
                final template = dummyTemplates[index];
                return TemplateCard(
                  templateName: template.templateName,
                  lastUpdated: template.lastUpdated,
                  imageUrl: template.imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
