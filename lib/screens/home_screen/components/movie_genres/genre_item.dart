import 'package:flutter/material.dart';
import 'package:movies/constants/app_colors.dart';

import '../../../../constants/theme_constants.dart';

class GenreItem extends StatelessWidget {
  const GenreItem({
    super.key,
    required this.height,
    required this.title,
    required this.isActive,
  });

  final double height;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive
                  ? AppColors.textColor
                  : AppColors.grayColor.withOpacity(0.6),
              fontSize: ThemeConstants.h4,
              fontWeight: FontWeight.w600,
            ),
          ),
          // WidgetUtils.verticalSpace(size: 8),
          isActive
              ? ClipOval(
                  child: Container(
                    // height: height * 0.0006,
                    width: height * 0.006,
                    color: AppColors.primaryColor,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
