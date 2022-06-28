import 'package:ebitcoiner/data/models/plan_contract_model.dart';

abstract class PlanContractRepo {
  Future<List<GetPlanContractResponseModel>> getPlanContract();
  Future<String> addPlanContract({required AddPlanContractRequestModel addPlanContractRequestModel});
}
