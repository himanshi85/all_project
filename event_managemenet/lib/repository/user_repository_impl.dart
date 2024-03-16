import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:event_managemenet/model/user_model.dart';
import 'package:event_managemenet/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<DioException, UserModel>> postData() async {
    try {
      return  Right(UserModel());
    } catch (e) {
      return left(DioException(requestOptions: requestOptions))
    }
  }
}
