import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class BusinessInformationTile extends StatelessWidget {
  const BusinessInformationTile({
    required this.label,
    required this.value,
    super.key,
    this.valueTextStyle,
  });
  final String label;
  final String value;
  final TextStyle? valueTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: AppTextStyles.bodyText(
            context,
          ).copyWith(color: AppColors.secondaryText),
        ),
        Text(value, style: valueTextStyle ?? AppTextStyles.bodyText(context)),
      ],
    );
  }
}
