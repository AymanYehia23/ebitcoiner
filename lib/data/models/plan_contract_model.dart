class AddPlanContractRequestModel {
  String planId;
  String currency;
  AddPlanContractRequestModel({
    required this.planId,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'planID': planId,
      'currency': currency,
    };
  }
}

class GetPlanContractResponseModel {
  String? sId;
  bool? demo;
  String? cryptoName;
  String? startDate;
  String? endDate;
  double? totalMined;
  bool? planStatus;
  double? hashPower;
  String? userID;
  String? planID;
  List<HourlyGains>? hourlyGains;
  int? iV;

  GetPlanContractResponseModel({
    this.sId = '',
    this.demo = true,
    this.cryptoName = '',
    this.startDate = '',
    this.endDate = '',
    this.totalMined = 0.0,
    this.planStatus = true,
    this.hashPower = 0.0,
    this.userID = '',
    this.planID = '',
    this.hourlyGains,
    this.iV = 0,
  });

  GetPlanContractResponseModel.fromJson(Map<String, dynamic> json) {
    json['_id'] == null ? sId = '' : sId = json['_id'];
    json['demo'] == null ? demo = true : demo = json['demo'];
    json['cryptoName'] == null
        ? cryptoName = ''
        : cryptoName = json['cryptoName'];
    json['startDate'] == null
        ? startDate = ''
        : startDate = json['startDate'].toString().substring(0, 10);
    json['endDate'] == null
        ? endDate = ''
        : endDate = json['endDate'].toString().substring(0, 10);
    json['totalMined'] == null
        ? totalMined = 0.0
        : totalMined = json['totalMined'] + 0.0;
    json['planStatus'] == null
        ? planStatus = true
        : planStatus = json['planStatus'];
    json['hashPower'] == null
        ? hashPower = 0.0
        : hashPower = json['hashPower'] + 0.0;
    json['userID'] == null ? userID = '' : userID = json['userID'];
    json['planID'] == null ? planID = '' : planID = json['planID'];
    if (json['hourlyGains'] != null) {
      hourlyGains = <HourlyGains>[];
      json['hourlyGains'].forEach((v) {
        hourlyGains!.add(HourlyGains.fromJson(v));
      });
    }
    json['__v'] == null ? iV = 0 : iV = json['__v'];
  }
}

class HourlyGains {
  String? date;
  double? profit;
  String? sId;

  HourlyGains({this.date = '', this.profit = 0.0, this.sId = ''});

  HourlyGains.fromJson(Map<String, dynamic> json) {
    json['date'] == null ? date = '' : date = json['date'];
    json['profit'] == null ? profit = 0.0 : profit = json['profit'] + 0.0;
    json['_id'] == null ? sId = '' : sId = json['_id'];
  }
}
