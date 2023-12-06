import 'dart:developer';

import 'package:coffee_wonders_for_technical/core/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../data/models/all_parts_model.dart';
import '../data/models/all_service_requests_model.dart';
import '../data/params.dart';
import '../data/repository/home_repository.dart';
import '../data/repository/home_repository_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  final HomeRepository _homeRepository = HomeRepositoryImpl();
  late AllServiceRequestsModel allServiceRequestsModel;
  late AllPartsModel allPartsModel;
  List<String> statusList(BuildContext context) => [
        AppLocalizations.of(context)!.approve,
        AppLocalizations.of(context)!.arrived,
        AppLocalizations.of(context)!.started,
      ];
  final formKey = GlobalKey<FormState>();

  List<FinishedServicePartParam> finishedServicePartParams = [];

  void getAllServiceRequests(BuildContext context) async {
    emit(HomeLoadingState());
    final result = await _homeRepository.getAllServiceRequests();
    result.fold(
      (failure) {
        emit(HomeErrorState(message: failure.message));
      },
      (data) {
        allServiceRequestsModel = data;

        emit(HomeLoadedState(allServiceRequestsModel: allServiceRequestsModel));
      },
    );
  }

  void changeExpanded(int index, bool isExpanded) {
    allServiceRequestsModel.data[index].isExpanded = isExpanded;
    emit(HomeLoadedState(allServiceRequestsModel: allServiceRequestsModel));
  }

  approveServiceRequests(BuildContext context, String serviceId) async {
    final result = await _homeRepository.approveServiceRequests(
      serviceId: serviceId,
    );
    result.fold(
      (failure) {
        emit(HomeErrorState(message: failure.message));
      },
      (data) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              data,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            backgroundColor: ColorManager.green,
          ),
        );
        getAllServiceRequests(context);
      },
    );
  }

  arriveServiceRequests(BuildContext context, String serviceId) async {
    final result = await _homeRepository.arriveServiceRequests(
      serviceId: serviceId,
    );
    result.fold(
      (failure) {
        emit(HomeErrorState(message: failure.message));
      },
      (data) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              data,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            backgroundColor: ColorManager.green,
          ),
        );
        getAllServiceRequests(context);
      },
    );
  }

  startServiceRequests(BuildContext context, String serviceId) async {
    final result = await _homeRepository.startServiceRequests(
      serviceId: serviceId,
    );
    result.fold(
      (failure) {
        emit(HomeErrorState(message: failure.message));
      },
      (data) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              data,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            backgroundColor: ColorManager.green,
          ),
        );
        getAllServiceRequests(context);
      },
    );
  }

  void finishedService(BuildContext context, String serviceId) async {
    if (formKey.currentState!.validate()) {
      log(finishedServicePartParams.toString());
      emit(GetAllPartsLoadingState());
      final result = await _homeRepository.finishServiceRequests(
        serviceId: serviceId,
        params: FinishedServiceParams(parts: finishedServicePartParams),
      );
      result.fold(
        (failure) {
          Fluttertoast.showToast(
            msg: failure.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManager.error,
            textColor: ColorManager.white,
            fontSize: 16.0,
          );

          emit(GetAllPartsLoadedState(allPartsModel: allPartsModel));
        },
        (data) {
          Fluttertoast.showToast(
            msg: data,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManager.green,
            textColor: ColorManager.white,
            fontSize: 16.0,
          );
          Get.toNamed(Routes.homeRoute);
          getAllServiceRequests(context);
        },
      );
    }
  }

  getAllServicesParts() async {
    emit(GetAllPartsLoadingState());
    final result = await _homeRepository.getAllParts();
    result.fold(
      (failure) {
        emit(GetAllPartsErrorState(message: failure.message));
      },
      (data) {
        allPartsModel = data;
        emit(GetAllPartsLoadedState(allPartsModel: data));
      },
    );
  }

  changePartSelected(int index, bool? value) {
    emit(ChangeSelectedPartLoadingState());
    if (value!) {
      finishedServicePartParams.add(
        FinishedServicePartParam(
          id: allPartsModel.data[index].id,
          quantity: 1,
        ),
      );
    } else {
      finishedServicePartParams.removeWhere(
        (element) => element.id == allPartsModel.data[index].id,
      );
    }
    emit(ChangeSelectedPartLoadedState());
  }

  void changePartCount(int id, String value) {
    finishedServicePartParams.forEach((element) {
      if (element.id == allPartsModel.data[id].id) {
        element.quantity = int.parse(value);
      }
    });
    emit(ChangeSelectedPartLoadedState());
  }
}
