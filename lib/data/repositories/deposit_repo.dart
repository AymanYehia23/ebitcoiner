import 'package:ebitcoiner/data/models/deposit_model.dart';

abstract class DepositRepo {
  Future<DepositAddressResponseModel> getDepositAddress({required DepositAddressRequestModel depositAddressRequestModel});
  Future<List<DepositModel>> getDeposits();
}
