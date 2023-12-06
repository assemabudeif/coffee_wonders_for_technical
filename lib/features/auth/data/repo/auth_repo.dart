import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../models/egypt_login_model.dart';
import '../params.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> login(LoginParams params);
}
