import 'package:event_managemenet/utils/dialog_utils.dart';

class UserModel {
  String? email;
  String? username;
  String? id;
  String? mobileNumber;
  SetStatus? status;

  UserModel(
      {this.email, this.username, this.id, this.mobileNumber, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    id = json['id'];
    mobileNumber = json['mobileNumber'];
    status = SetStatus.values.byName(json['status'] ?? 'loading');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['id'] = id;
    data['mobileNumber'] = mobileNumber;
    data['status'] = SetStatus.values[status?.index ?? 0].name;
    return data;
  }
}

enum SetStatus { loading, success, failure }
