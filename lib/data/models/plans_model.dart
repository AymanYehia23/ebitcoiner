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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    if (plansHashPower != null) {
      data['PlansHashPower'] =
          plansHashPower!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plan {
  String? sId;
  String? planType;
  String? planName;
  String? cryptoName;
  String? algorithm;
  int? planDuration;
  int? profitability;
  int? price;
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
    planDuration = json['planDuration'];
    profitability = json['profitability'];
    price = json['price'];
    availability = json['availability'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['planType'] = planType;
    data['planName'] = planName;
    data['cryptoName'] = cryptoName;
    data['algorithm'] = algorithm;
    data['planDuration'] = planDuration;
    data['profitability'] = profitability;
    data['price'] = price;
    data['availability'] = availability;
    data['__v'] = iV;
    return data;
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
