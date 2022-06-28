import 'package:ebitcoiner/data/models/asic_contract_model.dart';

abstract class AsicContractRepo {
  Future<List<GetAsicContractResponseModel>> getAsicContract();
  Future<dynamic> addAsicContract({required AddAsicContractRequestModel addAsicContractRequestModel});
}
