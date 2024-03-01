import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../theme/colors.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 232,
        height: 232,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(120),
          color: AppColors.appThemeColor,
        ),
        child: const SizedBox(
          width: 107,
          height: 107,
          child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [Colors.white],
            strokeWidth: 1,
          ),
        ));
  }
}
