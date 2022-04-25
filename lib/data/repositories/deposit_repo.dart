import 'package:hash_store/data/models/deposit_model.dart';

abstract class DepositRepo {
  Future<DepositAddressModel> getDepositAddress(String currency);
  Future<List<DepositModel>> getDeposits();
}
