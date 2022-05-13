class PlansRequestModel {
  String cryptoName;
  String planType;
  PlansRequestModel({
    required this.cryptoName,
    required this.planType,
  });
}

class PlansResponseModel {
  List<Plan>? plans;
  List<PlansHashPower>? plansHashPower;

  PlansResponseModel({this.plans, this.plansHashPower});

  PlansResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plan>[];
      json['plans'].forEach((v) {
        plans!.add(Plan.fromJson(v));
      });
    }
    if (json['PlansHashPower'] != null) {
      plansHashPower = <PlansHashPower>[];
      json['PlansHashPower'].forEach((v) {
        plansHashPower!.add(PlansHashPower.fromJson(v));
      });
    }
  }
}

class Plan {
  String? sId;
  String? planType;
  String? planName;
  String? cryptoName;
  String? algorithm;
  double? planDuration;
  double? profitability;
  double? price;
  bool? availability;
  int? iV;

  Plan({
    this.sId = '',
    this.planType = '',
    this.planName = '',
    this.cryptoName = '',
    this.algorithm = '',
    this.planDuration = 0.0,
    this.profitability = 0.0,
    this.price = 0.0,
    this.availability = true,
    this.iV = 0,
  });

  Plan.fromJson(Map<String, dynamic> json) {
    json['_id'] == null ? sId = '' : sId = json['_id'];
    json['planType'] == null ? planType = '' : planType = json['planType'];
    json['planName'] == null ? planName = '' : planName = json['planName'];
    json['cryptoName'] == null
        ? cryptoName = ''
        : cryptoName = json['cryptoName'];
    json['algorithm'] == null ? algorithm = '' : algorithm = json['algorithm'];
    json['planDuration'] == null
        ? planDuration = 0.0
        : planDuration = json['planDuration'] + 0.0;
    json['profitability'] == null
        ? profitability = 0.0
        : profitability = json['profitability'] + 0.0;
    json['price'] == null ? price = 0.0 : price = json['price'] + 0.0;
    json['availability'] == null
        ? availability = true
        : availability = json['availability'];
    json['__v'] == null ? iV = 0 : iV = json['__v'];
  }
}

class PlansHashPower {
  String? planId = '';
  double? hashrate = 0.0;

  PlansHashPower({this.planId, this.hashrate});

  PlansHashPower.fromJson(Map<String, dynamic> json) {
    json['planid'] == null ? planId = '' : planId = json['planid'];
    json['hashrate'] == null ? hashrate = 0.0 : hashrate = json['hashrate'];
  }
}
