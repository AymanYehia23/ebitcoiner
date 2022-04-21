class AsicModel {
  String? sId;
  String? asicName;
  String? cryptoName;
  String? algorithm;
  int? hashPower;
  int? price;
  int? hostFees;
  bool? availability;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AsicModel(
      {this.sId,
      this.asicName,
      this.cryptoName,
      this.algorithm,
      this.hashPower,
      this.price,
      this.hostFees,
      this.availability,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AsicModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    asicName = json['asicName'];
    cryptoName = json['cryptoName'];
    algorithm = json['algorithm'];
    hashPower = json['hashPower'];
    price = json['price'];
    hostFees = json['hostFees'];
    availability = json['availability'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
