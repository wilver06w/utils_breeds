import 'package:flutter/material.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:lottie/lottie.dart';
import 'package:utils_breeds/utils/constant/responsive.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';

class YuGiOhLoading {
  static void show(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Lottie.asset(
            BreedUiValues.catSplashAnimation,
            height: BreedResponsive.heightSizeByContext(
              context,
              pixels: BreedSpacing.xxs,
            ),
            width: BreedResponsive.withSizeByContext(
              context,
              pixels: BreedSpacing.xxs,
            ),
          ),
        );
      },
    );
  }
}
