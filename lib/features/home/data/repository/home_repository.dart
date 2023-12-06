import '/features/home/data/models/all_parts_model.dart';

import '/features/home/data/params.dart';
import '/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../models/all_service_requests_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, AllServiceRequestsModel>> getAllServiceRequests();
  Future<Either<Failure, String>> approveServiceRequests({
    required String serviceId,
  });
  Future<Either<Failure, String>> arriveServiceRequests({
    required String serviceId,
  });
  Future<Either<Failure, String>> startServiceRequests({
    required String serviceId,
  });
  Future<Either<Failure, String>> finishServiceRequests({
    required FinishedServiceParams params,
    required String serviceId,
  });

  Future<Either<Failure, AllPartsModel>> getAllParts();
}
