import 'package:hash_store/data/models/asic_contract_model.dart';

abstract class AsicContractRepo {
  Future<List<AsicContractModel>> getAsicContract();
}
