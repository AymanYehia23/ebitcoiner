class AsicModel {
  String? sId;
  String? asicName;
  String? cryptoName;
  String? algorithm;
  double? hashPower;
  double? price;
  double? hostFees;
  bool? availability;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AsicModel({
    this.sId = '',
    this.asicName = '',
    this.cryptoName = '',
    this.algorithm = '',
    this.hashPower = 0.0,
    this.price = 0.0,
    this.hostFees = 0.0,
    this.availability = true,
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
  });

  AsicModel.fromJson(Map<String, dynamic> json) {
    json['_id'] == null ? sId = '' : sId = json['_id'];
    json['asicName'] == null ? asicName = '' : asicName = json['asicName'];
    json['cryptoName'] == null
        ? cryptoName = ''
        : cryptoName = json['cryptoName'];
    json['algorithm'] == null ? algorithm = '' : algorithm = json['algorithm'];
    json['hashPower'] == null
        ? hashPower = 0.0
        : hashPower = json['hashPower'] + 0.0;
    json['price'] == null ? price = 0.0 : price = json['price'] + 0.0;
    json['hostFees'] == null
        ? hostFees = 0.0
        : hostFees = json['hostFees'] + 0.0;
    json['availability'] == null
        ? availability = true
        : availability = json['availability'];
    json['createdAt'] == null ? createdAt = '' : createdAt = json['createdAt'];
    json['updatedAt'] == null ? updatedAt = '' : updatedAt = json['updatedAt'];
    json['__v'] == null ? iV = 0 : iV = json['__v'];
  }
}
