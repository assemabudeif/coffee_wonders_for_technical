import 'dart:developer';

import 'package:coffee_wonders_for_technical/features/home/data/models/all_parts_model.dart';
import 'package:coffee_wonders_for_technical/features/home/data/params.dart';

import '/core/error/failures.dart';
import '/core/services/dio_helper/dio_helper.dart';

import '/features/home/data/models/all_service_requests_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/api_constant.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either<Failure, AllServiceRequestsModel>>
      getAllServiceRequests() async {
    try {
      final response =
          await DioHelper.getData(path: ApiConstant.getAllRequestsServicePath);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(AllServiceRequestsModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data.toString() ?? 'Failed to get all service requests'));
    }
  }

  @override
  Future<Either<Failure, String>> approveServiceRequests({
    required String serviceId,
  }) async {
    try {
      final response = await DioHelper.getData(
        path: ApiConstant.approveServicePath(serviceId),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right('Approved Successfully');
      } else {
        return Left(ServerFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data.toString() ?? 'Failed to approve service requests'));
    }
  }

  @override
  Future<Either<Failure, String>> arriveServiceRequests({
    required String serviceId,
  }) async {
    try {
      final response = await DioHelper.getData(
        path: ApiConstant.arrivedServicePath(serviceId),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right('Arrived Successfully');
      } else {
        return Left(ServerFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data.toString() ?? 'Failed to arrive service requests'));
    }
  }

  @override
  Future<Either<Failure, String>> finishServiceRequests({
    required FinishedServiceParams params,
    required String serviceId,
  }) async {
    try {
      log('Params: ${params.toJson()}');
      final response = await DioHelper.postData(
        path: ApiConstant.finishedServicePath(serviceId),
        data: (params.parts.isNotEmpty) ? params.toJson() : null,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right('Finished Successfully');
      } else {
        return Left(ServerFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data.toString() ?? 'Failed to finish service requests'));
    }
  }

  @override
  Future<Either<Failure, String>> startServiceRequests({
    required String serviceId,
  }) async {
    try {
      final response = await DioHelper.getData(
        path: ApiConstant.startedServicePath(serviceId),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right('Started Successfully');
      } else {
        return Left(ServerFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data.toString() ?? 'Failed to start service requests'));
    }
  }

  @override
  Future<Either<Failure, AllPartsModel>> getAllParts() async {
    try {
      final response = await DioHelper.getData(
        path: ApiConstant.getAllPartsPath,
        queryParameters: {
          'all_data': '1',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(AllPartsModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      return Left(
          ServerFailure(e.response?.data.toString() ?? 'Failed to get Parts'));
    }
  }
}
