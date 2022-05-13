import 'package:hash_store/data/models/deposit_model.dart';

abstract class DepositRepo {
  Future<DepositAddressResponseModel> getDepositAddress({required DepositAddressRequestModel depositAddressRequestModel});
  Future<List<DepositModel>> getDeposits();
}
