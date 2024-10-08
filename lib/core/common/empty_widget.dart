import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.empty,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorManager.grey.withOpacity(0.9),
                fontSize: FontSizeManager.s20.sp,
              ),
        ),
      ),
    );
  }
}
