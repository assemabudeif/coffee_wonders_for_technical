import '/core/constant/api_constant.dart';
import '/core/services/dio_helper/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/egypt_login_model.dart';
import '../params.dart';
import 'auth_repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Failure, LoginModel>> login(LoginParams params) async {
    try {
      final response = await DioHelper.postData(
        path: ApiConstant.loginPath,
        data: params.toJson(),
      );

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data["status"] == "success") {
        return Right(LoginModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.data['message']));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }
}
