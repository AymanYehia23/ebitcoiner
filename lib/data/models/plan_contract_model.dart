class PlanContractsResponseModel {
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

  PlanContractsResponseModel({
    this.sId,
    this.demo,
    this.cryptoName,
    this.startDate,
    this.endDate,
    this.totalMined,
    this.planStatus,
    this.hashPower,
    this.userID,
    this.planID,
    this.hourlyGains,
    this.iV,
  });

  PlanContractsResponseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    demo = json['demo'];
    cryptoName = json['cryptoName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalMined = json['totalMined'];
    planStatus = json['planStatus'];
    hashPower = json['hashPower'];
    userID = json['userID'];
    planID = json['planID'];
    if (json['hourlyGains'] != null) {
      hourlyGains = <HourlyGains>[];
      json['hourlyGains'].forEach((v) {
        hourlyGains!.add(HourlyGains.fromJson(v));
      });
    }
    iV = json['__v'];
  }
}

class HourlyGains {
  String? date;
  double? profit;
  String? sId;

  HourlyGains({this.date, this.profit, this.sId});

  HourlyGains.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    profit = json['profit'];
    sId = json['_id'];
  }
}
