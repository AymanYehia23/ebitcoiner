class PlanContractModel {
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

  PlanContractModel({
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

  PlanContractModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    demo = json['demo'];
    cryptoName = json['cryptoName'];
    startDate = json['startDate'].toString().substring(0,10);
    endDate = json['endDate'].toString().substring(0, 10);
    totalMined = json['totalMined'] + 0.0;
    planStatus = json['planStatus'];
    hashPower = json['hashPower'] + 0.0;
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
