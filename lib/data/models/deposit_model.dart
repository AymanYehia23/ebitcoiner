class DepositAddressRequestModel {
  String currency;
  DepositAddressRequestModel({
    required this.currency,
  });
}

class DepositAddressResponseModel {
  String? address;

  DepositAddressResponseModel({this.address = ''});

  DepositAddressResponseModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }
}

class DepositModel {
  String? sId;
  String? depositSource;
  String? amount;
  String? currency;
  String? transactionStatus;
  String? txnId;
  String? userID;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DepositModel({
    this.sId = '',
    this.depositSource = '',
    this.amount = '',
    this.currency = '',
    this.transactionStatus = '',
    this.txnId = '',
    this.userID = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
  });

  DepositModel.fromJson(Map<String, dynamic> json) {
    json['_id'] == null ? sId = '' : sId = json['_id'];
    json['depositSource'] == null
        ? depositSource = ''
        : depositSource = json['depositSource'];
    json['amount'] == null
        ? amount = ''
        : amount = json['amount'].toStringAsFixed(10);
    json['currency'] == null ? currency = '' : currency = json['currency'];
    json['transactionStatus'] == null
        ? transactionStatus = ''
        : transactionStatus = json['transactionStatus'];
    json['txn_id'] == null
        ? txnId = ''
        : txnId = json['txn_id'].substring(0, 15);

    json['userID'] == null ? userID = '' : userID = json['userID'];
    json['createdAt'] == null
        ? createdAt = ''
        : createdAt =
            '${json['createdAt'].substring(0, 10)} -- ${json['createdAt'].substring(11, 16)}';
    json['updatedAt'] == null ? updatedAt = '' : updatedAt = json['updatedAt'];
    json['__v'] == null ? iV = 0 : iV = json['__v'];
  }
}
