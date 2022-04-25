class WithdrawRequestModel {
  String currency;
  String amount;
  String address;
  WithdrawRequestModel({
    required this.currency,
    required this.amount,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'amount': amount,
      'address': address,
    };
  }
}

class WithdrawResponseModel {
  String? sId;
  String? address;
  double? amount;
  String? currency;
  String? transactionStatus;
  String? userID;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? txnId;

  WithdrawResponseModel(
      {this.sId,
      this.address,
      this.amount,
      this.currency,
      this.transactionStatus,
      this.userID,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.txnId});

  WithdrawResponseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    address = json['address'];
    amount = json['amount'];
    currency = json['currency'];
    transactionStatus = json['transactionStatus'];
    userID = json['userID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    txnId = json['txn_id'];
  }
}
