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
  String? amount;
  String? currency;
  String? transactionStatus;
  String? userID;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? txnId;

  WithdrawResponseModel({
    this.sId = '',
    this.address = '',
    this.amount = '',
    this.currency = '',
    this.transactionStatus = '',
    this.userID = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
    this.txnId = '',
  });

  WithdrawResponseModel.fromJson(Map<String, dynamic> json) {
    json['_id'] == null ? sId = '' : sId = json['_id'];
    json['address'] == null ? address = '' : address = json['address'];
    json['amount'] == null
        ? amount = ''
        : amount = json['amount'].toStringAsFixed(10);
    json['currency'] == null ? currency = '' : currency = json['currency'];
    json['transactionStatus'] == null
        ? transactionStatus = ''
        : transactionStatus = json['transactionStatus'];
    json['userID'] == null ? userID = '' : userID = json['userID'];
    json['updatedAt'] == null ? updatedAt = '' : updatedAt = json['updatedAt'];
    json['createdAt'] == null
        ? createdAt = ''
        : createdAt =
            '${json['createdAt'].substring(0, 10)} -- ${json['createdAt'].substring(11, 16)}';
    json['__v'] == null ? iV = 0 : iV = json['__v'];
    json['txn_id'] == null
        ? txnId = ''
        : txnId = json['txn_id'].substring(0, 15);
  }
}
