class AsicContractModel {
  String? sId;
  double? hostFees;
  String? asicName;
  bool? asicStatus;
  bool? expired;
  double? totalMined;
  String? startDate;
  String? userID;
  String? asicID;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AsicContractModel(
      {this.sId,
      this.hostFees,
      this.asicName,
      this.asicStatus,
      this.expired,
      this.totalMined,
      this.startDate,
      this.userID,
      this.asicID,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AsicContractModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hostFees = json['hostFees'] + 0.0;
    asicName = json['asicName'];
    asicStatus = json['asicStatus'];
    expired = json['expired'];
    totalMined = json['totalMined'] + 0.0;
    startDate = json['startDate'].toString().substring(0, 10);
    userID = json['userID'];
    asicID = json['asicID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
