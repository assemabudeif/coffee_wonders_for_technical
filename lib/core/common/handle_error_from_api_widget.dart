import '/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HandleErrorFromApiWidget extends StatelessWidget {
  const HandleErrorFromApiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(
          20.w,
        ),
        alignment: Alignment.center,
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.failedToLoadData,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.error,
            ),
          ),
        ));
  }
}
