import 'package:coffee_wonders_for_technical/core/common/empty_widget.dart';
import 'package:coffee_wonders_for_technical/core/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../data/models/all_service_requests_model.dart';
import '../../view_model/home_cubit.dart';

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({super.key, required this.model});

  final AllServiceRequestsModel model;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager.mintGreen,
      onRefresh: () async {
        HomeCubit.get(context).getAllServiceRequests(context);
      },
      child: model.data.isEmpty
          ? const EmptyWidget()
          : ListView.separated(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: EdgeInsets.all(10.w),
              itemBuilder: (context, listIndex) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: ExpansionPanelList(
                      expansionCallback: (int exIndex, bool isExpanded) {
                        HomeCubit.get(context)
                            .changeExpanded(listIndex, isExpanded);
                      },
                      children: [
                        ExpansionPanel(
                          isExpanded: model.data[listIndex].isExpanded,
                          canTapOnHeader: true,
                          headerBuilder: (context, isExpanded) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              clipBehavior: Clip.antiAlias,
                              padding: EdgeInsets.all(10.w),
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    HomeCubit.get(context)
                                        .allServiceRequestsModel
                                        .data[listIndex]
                                        .product
                                        .photo,

                                    // fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  model.data[listIndex].product.name,
                                ),
                                subtitle: Text(
                                  model.data[listIndex].statusString,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: _getStatusColor(
                                          model.data[listIndex].status,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                titleTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            );
                          },
                          body: Padding(
                            padding: EdgeInsets.all(10.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildItemOfRequestDetails(
                                  firstText: AppLocalizations.of(context)!.code,
                                  secondText: model.data[listIndex].code,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.status,
                                  secondText:
                                      model.data[listIndex].statusString,
                                  secondTextColor: _getStatusColor(
                                    model.data[listIndex].status,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.country,
                                  secondText: model.data[listIndex].country,
                                  secondTextColor: _getStatusColor(
                                    model.data[listIndex].status,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.state,
                                  secondText: model.data[listIndex].state,
                                  secondTextColor: _getStatusColor(
                                    model.data[listIndex].status,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText: AppLocalizations.of(context)!.area,
                                  secondText: model.data[listIndex].area,
                                  secondTextColor: _getStatusColor(
                                    model.data[listIndex].status,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText: AppLocalizations.of(context)!
                                      .buildingNumber,
                                  secondText: model.data[listIndex].building,
                                  secondTextColor: _getStatusColor(
                                    model.data[listIndex].status,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText: AppLocalizations.of(context)!
                                      .apartmentNumber,
                                  secondText: model.data[listIndex].apartment,
                                  secondTextColor: _getStatusColor(
                                    model.data[listIndex].status,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.postalCode,
                                  secondText: model.data[listIndex].postalCode,
                                  secondTextColor: _getStatusColor(
                                    model.data[listIndex].status,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                if (HomeCubit.get(context)
                                        .allServiceRequestsModel
                                        .data[listIndex]
                                        .status !=
                                    "5")
                                  Row(
                                    children: [
                                      Text(
                                        "${AppLocalizations.of(context)!.changeStatus}: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Visibility(
                                        visible: HomeCubit.get(context)
                                                .allServiceRequestsModel
                                                .data[listIndex]
                                                .status ==
                                            "1",
                                        child: InkWell(
                                          onTap: () {
                                            HomeCubit.get(context)
                                                .approveServiceRequests(
                                              context,
                                              model.data[listIndex].id
                                                  .toString(),
                                            );
                                          },
                                          child: Chip(
                                            label: Text(
                                              AppLocalizations.of(context)!
                                                  .approve,
                                            ),
                                            backgroundColor: _getStatusColor(
                                              (int.parse(model.data[listIndex]
                                                          .status) +
                                                      1)
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: HomeCubit.get(context)
                                                .allServiceRequestsModel
                                                .data[listIndex]
                                                .status ==
                                            "2",
                                        child: InkWell(
                                          onTap: () {
                                            HomeCubit.get(context)
                                                .arriveServiceRequests(
                                              context,
                                              model.data[listIndex].id
                                                  .toString(),
                                            );
                                          },
                                          child: Chip(
                                            label: Text(
                                              AppLocalizations.of(context)!
                                                  .arrived,
                                            ),
                                            backgroundColor:
                                                ColorManager.mintGreen,
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: HomeCubit.get(context)
                                                .allServiceRequestsModel
                                                .data[listIndex]
                                                .status ==
                                            "3",
                                        child: InkWell(
                                          onTap: () {
                                            HomeCubit.get(context)
                                                .startServiceRequests(
                                              context,
                                              model.data[listIndex].id
                                                  .toString(),
                                            );
                                          },
                                          child: Chip(
                                            label: Text(
                                              AppLocalizations.of(context)!
                                                  .started,
                                            ),
                                            backgroundColor:
                                                ColorManager.mintGreen,
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: HomeCubit.get(context)
                                                .allServiceRequestsModel
                                                .data[listIndex]
                                                .status ==
                                            "4",
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              Routes.finishServiceRoute,
                                              arguments: model
                                                  .data[listIndex].id
                                                  .toString(),
                                            );
                                          },
                                          child: Chip(
                                            label: Text(
                                              AppLocalizations.of(context)!
                                                  .finished,
                                            ),
                                            backgroundColor:
                                                ColorManager.mintGreen,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.startTime,
                                  secondText: model.data[listIndex].startTime,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.endTime,
                                  secondText: model.data[listIndex].endTime,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.workHorus,
                                  secondText: model.data[listIndex].hours,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.clientName,
                                  secondText: model.data[listIndex].client.name,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.clientEmail,
                                  secondText:
                                      model.data[listIndex].client.email,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                _buildItemOfRequestDetails(
                                  firstText:
                                      AppLocalizations.of(context)!.price,
                                  secondText:
                                      model.data[listIndex].price.toString(),
                                ),
                                Visibility(
                                  visible:
                                      model.data[listIndex].parts.isNotEmpty,
                                  child: Column(
                                    children: [
                                      Divider(
                                        thickness: 1,
                                        height: 10.h,
                                        color: ColorManager.primaryColor,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.parts,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppConstants.isDark
                                                  ? ColorManager.white
                                                  : ColorManager.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return _buildItemOfRequestDetails(
                                            firstText: model.data[listIndex]
                                                .parts[index].name,
                                            secondText: model.data[listIndex]
                                                .parts[index].price
                                                .toString(),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            const Divider(),
                                        itemCount:
                                            model.data[listIndex].parts.length,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: model.data.length,
            ),
    );
  }

  Color _getStatusColor(String id) {
    switch (id) {
      case "0":
        return Colors.orange;
      case "1":
        return Colors.red;
      case "2":
      case "3":
      case "4":
        return Colors.grey;
      case "5":
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  _buildItemOfRequestDetails({
    required String firstText,
    required String secondText,
    Color firstTextColor = ColorManager.primaryColor,
    Color secondTextColor = ColorManager.mintGreen,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$firstText: ',
            style: TextStyle(
              color: AppConstants.isDark
                  // sl<SharedPreferences>().getBool(SharedKey.isDark.name) ??
                  //         false
                  ? Colors.white
                  : firstTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: secondTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
