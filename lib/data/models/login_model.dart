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

class User {
  String? userID;
  String? name;
  String? email;
  String? phone;
  Balance? balance;
  Balance? demoBalance;
  int? activePlans;
  int? activeDemoPlans;
  int? devices;

  User(this.userID, this.name, this.email, this.phone, this.balance,
      this.demoBalance, this.activePlans, this.activeDemoPlans, this.devices);

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

class Balance {
  dynamic eth;
  dynamic btc;

  Balance(this.eth, this.btc);

  Balance.fromJson(Map<String, dynamic> json) {
    eth = json['eth'];
    btc = json['btc'];
  }
}
