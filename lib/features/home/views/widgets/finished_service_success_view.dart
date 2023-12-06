import 'package:coffee_wonders_for_technical/core/resources/constants_manager.dart';
import 'package:coffee_wonders_for_technical/features/home/data/models/all_parts_model.dart';
import 'package:coffee_wonders_for_technical/features/home/view_model/home_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manager.dart';

class FinishedServiceSuccessView extends StatelessWidget {
  const FinishedServiceSuccessView(
      {super.key, required this.allPartsModel, required this.serviceId});

  final AllPartsModel allPartsModel;
  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: Form(
        key: HomeCubit.get(context).formKey,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.selectParts,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.isDark ? Colors.white : Colors.black,
                  ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allPartsModel.data.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CheckboxListTile(
                            title: Text(allPartsModel.data[index].name),
                            value: HomeCubit.get(context)
                                .finishedServicePartParams
                                .where(
                                  (element) =>
                                      element.id ==
                                      allPartsModel.data[index].id,
                                )
                                .isNotEmpty,
                            onChanged: (value) {
                              HomeCubit.get(context)
                                  .changePartSelected(index, value);
                            },
                          ),
                        ),
                        Visibility(
                          visible: HomeCubit.get(context)
                              .finishedServicePartParams
                              .where(
                                (element) =>
                                    element.id == allPartsModel.data[index].id,
                              )
                              .isNotEmpty,
                          child: Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "0",
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.number,
                              initialValue: "1",
                              onChanged: (value) {
                                HomeCubit.get(context).changePartCount(
                                  index,
                                  value,
                                );
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .thisIsRequired;
                                } else if (value == '0') {
                                  return AppLocalizations.of(context)!
                                      .thisIsRequired;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  HomeCubit.get(context).finishedService(context, serviceId);
                },
                child: Text(
                  AppLocalizations.of(context)!.finished,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
