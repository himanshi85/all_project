import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:event_managemenet/model/user_model.dart';

abstract class UserRepository {
  Future<Either<DioException, UserModel>> postData();
}
