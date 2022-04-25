class DepositAddressModel {
  String? address;

  DepositAddressModel({this.address});

  DepositAddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }
}

class DepositModel {
  String? sId;
  double? amount;
  String? currency;
  String? transactionStatus;
  String? txnId;
  String? userID;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DepositModel(
      {this.sId,
      this.amount,
      this.currency,
      this.transactionStatus,
      this.txnId,
      this.userID,
      this.createdAt,
      this.updatedAt,
      this.iV});

  DepositModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    amount = json['amount'];
    currency = json['currency'];
    transactionStatus = json['transactionStatus'];
    txnId = json['txn_id'];
    userID = json['userID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

