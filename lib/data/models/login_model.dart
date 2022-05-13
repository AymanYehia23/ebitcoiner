class FirstLoginRequestModel {
  String userName;
  String password;
  FirstLoginRequestModel({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}

class SecondLoginRequestModel {
  String userName;
  String otp;
  SecondLoginRequestModel({
    required this.userName,
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'otp': otp,
    };
  }
}

class LoginResponseModel {
  Jwt? jwt;
  User? user;
  LoginResponseModel({this.jwt, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'] != null ? Jwt.fromJson(json['jwt']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Jwt {
  String? accessToken;
  String? refreshToken;

  Jwt({
    this.accessToken = '',
    this.refreshToken = '',
  });

  Jwt.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class User {
  Balance? balance;
  String? userName;
  String? email;
  String? phone;
  int? activePlans;
  int? activeDemoPlans;
  int? devices;
  String? createdAt;

  User({
    required this.balance,
    this.userName = '',
    this.email = '',
    this.phone = '',
    this.activePlans = 0,
    this.activeDemoPlans = 0,
    this.devices = 0,
    this.createdAt = '',
  });
  User.fromJson(Map<String, dynamic> json) {
    balance =
        json['balance'] != null ? Balance.fromJson(json['balance']) : Balance();
    userName = json['userName'] ?? '';
    json['email'] == null ? email = '' : email = json['email'];
    json['phone'] == null ? phone = '' : phone = json['phone'];
    json['activePlans'] == null
        ? activePlans = 0
        : activePlans = json['activePlans'];
    json['activeDemoPlans'] == null
        ? activeDemoPlans = 0
        : activeDemoPlans = json['activeDemoPlans'];
    json['devices'] == null ? devices = 0 : devices = json['devices'];
    json['createdAt'] == null ? createdAt = '' : createdAt = json['createdAt'];
  }
}

class Balance {
  double? eth;
  double? btc;
  double? rvn;
  double? ltct;

  Balance({
    this.eth = 0.0,
    this.btc = 0.0,
    this.rvn = 0.0,
    this.ltct = 0.0,
  });

  Balance.fromJson(Map<String, dynamic> json) {
    json['eth'] == null ? eth = 0.0 : eth = json['eth'] + 0.0;
    json['btc'] == null ? btc = 0.0 : btc = json['btc'] + 0.0;
    json['rvn'] == null ? rvn = 0.0 : rvn = json['rvn'] + 0.0;
    json['ltct'] == null ? ltct = 0.0 : ltct = json['ltct'] + 0.0;
  }
}


