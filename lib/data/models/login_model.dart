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
  String? sId;
  String? userName;
  int? activePlans;
  int? activeDemoPlans;
  int? devices;

  User(
      {this.balance,
      this.demoBalance,
      this.sId,
      this.userName,
      this.activePlans,
      this.activeDemoPlans,
      this.devices,
      });

  User.fromJson(Map<String, dynamic> json) {
    balance =
        json['balance'] != null ? Balance.fromJson(json['balance']) : null;
    demoBalance = json['demoBalance'] != null
        ? DemoBalance.fromJson(json['demoBalance'])
        : null;
    sId = json['_id'];
    userName = json['userName'];
    activePlans = json['activePlans'];
    activeDemoPlans = json['activeDemoPlans'];
    devices = json['devices'];
  }

}

class Balance {
  double? ltct;
  double? eth;
  double? btc;

  Balance({this.ltct, this.eth, this.btc});

  Balance.fromJson(Map<String, dynamic> json) {
    ltct = json['ltct'] + 0.0;
    eth = json['eth'] + 0.0;
    btc = json['btc'] + 0.0;
  }
}

class DemoBalance {
  double? eth;
  double? btc;

  DemoBalance({this.eth, this.btc});

  DemoBalance.fromJson(Map<String, dynamic> json) {
    eth = json['eth'] + 0.0;
    btc = json['btc'] + 0.0;
  }
}
