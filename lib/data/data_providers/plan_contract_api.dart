import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/plan_contract_model.dart';

import '../repositories/plan_contract_repo.dart';

class PlanContractApi extends PlanContractRepo {
  @override
  Future<List<GetPlanContractResponseModel>> getPlanContract() async {
    List<GetPlanContractResponseModel> plansContractList = [];
    return await HttpService.getRequest(
      endPoint: Strings.getPlanContractEndPoint,
    ).then(
      (value) {
        value.data.forEach((element) {
          plansContractList.add(GetPlanContractResponseModel.fromJson(element));
        });
        return plansContractList;
      },
    );
  }

  @override
  Future<String> addPlanContract(
      {required AddPlanContractRequestModel
          addPlanContractRequestModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.addPlanContractEndPoint,
      data: addPlanContractRequestModel.toMap(),
    ).then(
      (value) => value.data.toString(),
    );
  }
}
