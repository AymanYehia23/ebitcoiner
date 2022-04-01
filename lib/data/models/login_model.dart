import 'package:hive/hive.dart';

part 'login_model.g.dart';

class LoginResponseModel {
  Jwt? jwt;
  User? user;

  LoginResponseModel({this.jwt, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    jwt = Jwt.fromJson(json['jwt']);
    user = User.fromJson(json['user']);
  }
}

class Jwt {
  String? accessToken;
  String? refreshToken;

  Jwt(this.accessToken, this.refreshToken);

  Jwt.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? userID;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  Balance? balance;
  @HiveField(5)
  Balance? demoBalance;
  @HiveField(6)
  int? activePlans;
  @HiveField(7)
  int? activeDemoPlans;
  @HiveField(8)
  int? devices;

  User(this.userID, this.name, this.email, this.phone, this.balance,
      this.demoBalance, this.activePlans, this.activeDemoPlans, this.devices);
  User.empty();

  User.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    balance = Balance.fromJson(json['balance']);
    demoBalance = Balance.fromJson(json['demoBalance']);
    activePlans = json['activePlans'];
    activeDemoPlans = json['activeDemoPlans'];
    devices = json['devices'];
  }
}

@HiveType(typeId: 1)
class Balance {
  @HiveField(0)
  dynamic eth;
  @HiveField(1)
  dynamic btc;

  Balance(this.eth, this.btc);

  Balance.fromJson(Map<String, dynamic> json) {
    eth = json['eth'];
    btc = json['btc'];
  }
}
