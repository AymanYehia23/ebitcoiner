class PlansModel {
  List<Plan>? plans;
  List<PlansHashPower>? plansHashPower;

  PlansModel({this.plans, this.plansHashPower});

  PlansModel.fromJson(Map<String, dynamic> json) {
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

  Plan(
      {this.sId,
      this.planType,
      this.planName,
      this.cryptoName,
      this.algorithm,
      this.planDuration,
      this.profitability,
      this.price,
      this.availability,
      this.iV});

  Plan.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    planType = json['planType'];
    planName = json['planName'];
    cryptoName = json['cryptoName'];
    algorithm = json['algorithm'];
    planDuration = json['planDuration'] + 0.0;
    profitability = json['profitability'] + 0.0;
    price = json['price'] + 0.0;
    availability = json['availability'];
    iV = json['__v'];
  }

  
}

class PlansHashPower {
  String? planId;
  double? hashrate;

  PlansHashPower({this.planId, this.hashrate});

  PlansHashPower.fromJson(Map<String, dynamic> json) {
    planId = json['planid'];
    hashrate = json['hashrate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planid'] = planId;
    data['hashrate'] = hashrate;
    return data;
  }
}
