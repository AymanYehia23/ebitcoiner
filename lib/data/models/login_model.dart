class LoginResponseModel {
  Jwt? jwt;
  User? user;

  LoginResponseModel({this.jwt, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'] != null ?  Jwt.fromJson(json['jwt']) : null;
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }
}

class Jwt {
  String? accessToken;
  String? refreshToken;

  Jwt({this.accessToken, this.refreshToken});

  Jwt.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}


class User {
  Balance? balance;
  DemoBalance? demoBalance;
  Temporary? temporary;
  String? userName;
  String? email;
  String? phone;
  int? activePlans;
  int? activeDemoPlans;
  int? devices;
  String? createdAt;

  User(
      {this.balance,
      this.demoBalance,
      this.temporary,
      this.userName,
      this.email,
      this.phone,
      this.activePlans,
      this.activeDemoPlans,
      this.devices,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    balance =
        json['balance'] != null ? Balance.fromJson(json['balance']) : null;
    demoBalance = json['demoBalance'] != null
        ? DemoBalance.fromJson(json['demoBalance'])
        : null;
    temporary = json['temporary'] != null
        ? Temporary.fromJson(json['temporary'])
        : null;
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    activePlans = json['activePlans'];
    activeDemoPlans = json['activeDemoPlans'];
    devices = json['devices'];
    createdAt = json['createdAt'];
  }

}

class Balance {
  double? eth;
  double? btc;
  double? rvn;
  double? ltct;

  Balance({this.eth, this.btc, this.rvn, this.ltct});

  Balance.fromJson(Map<String, dynamic> json) {
    eth = json['eth'] + 0.0;
    btc = json['btc'] + 0.0 ;
    rvn = json['rvn'] + 0.0;
    ltct = json['ltct'] + 0.0;
  }
}

class DemoBalance {
  double? rvn;
  double? ltct;
  double? eth;
  double? btc;

  DemoBalance({this.rvn, this.ltct, this.eth, this.btc});

  DemoBalance.fromJson(Map<String, dynamic> json) {
    rvn = json['rvn'] + 0.0;
    ltct = json['ltct'] + 0.0;
    eth = json['eth'] + 0.0;
    btc = json['btc'] + 0.0;
  }

}

class Temporary {
  int? code;

  Temporary({this.code});

  Temporary.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }
}
