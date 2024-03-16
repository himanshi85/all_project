import 'package:equatable/equatable.dart';
import 'package:event_managemenet/model/user_model.dart';

class BlocState extends Equatable {
   SetStatus? status;
   UserModel? userModel;

   BlocState({ this.status,  this.userModel});

  BlocState copyWith({UserModel? userModel, SetStatus? status}) {
    return BlocState(
        status: status ?? this.status, userModel: userModel ?? this.userModel);
  }

  @override
  List<Object?> get props => [userModel, status];
}

enum SetStatus { loading, failure, success }
