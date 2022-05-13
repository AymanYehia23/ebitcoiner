class AddAsicContractRequestModel {
  String asicID;
  String currency;
  AddAsicContractRequestModel({
    required this.asicID,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'asicID': asicID,
      'currency': currency,
    };
  }

}

class GetAsicContractResponseModel {

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

  GetAsicContractResponseModel({
    this.sId = '',
    this.hostFees = 0.0,
    this.asicName = '',
    this.asicStatus = true,
    this.expired = true,
    this.totalMined = 0.0,
    this.startDate = '',
    this.userID = '',
    this.asicID = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
  });

  GetAsicContractResponseModel.fromJson(Map<String, dynamic> json) {
    json['_id'] == null ? sId = '' : sId = json['_id'];
    json['hostFees'] == null
        ? hostFees = 0.0
        : hostFees = json['hostFees'] + 0.0;
    json['asicName'] == null ? asicName = '' : asicName = json['asicName'];
    json['asicStatus'] == null
        ? asicStatus = true
        : asicStatus = json['asicStatus'];
    json['expired'] == null ? expired = true : expired = json['expired'];
    json['totalMined'] == null
        ? totalMined = 0.0
        : totalMined = json['totalMined'] + 0.0;
    json['startDate'] == null
        ? startDate = ''
        : startDate = json['startDate'].toString().substring(0, 10);
    json['userID'] == null ? userID = '' : userID = json['userID'];
    json['asicID'] == null ? asicID = '' : asicID = json['asicID'];
    json['createdAt'] == null ? createdAt = '' : createdAt = json['createdAt'];
    json['updatedAt'] == null ? updatedAt = '' : updatedAt = json['updatedAt'];
    json['__v'] == null ? iV = 0 : iV = json['__v'];
  }
}
