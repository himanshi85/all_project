import 'package:event_managemenet/bloc/bloc_state.dart';
import 'package:event_managemenet/model/user_model.dart' hide SetStatus;
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCubit extends Cubit<BlocState> {
  BlocCubit():super(BlocState());

  void postData({required UserModel model}){
    emit(state.copyWith(status:SetStatus.loading));
  }

}