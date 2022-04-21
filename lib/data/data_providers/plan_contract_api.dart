import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/plan_contract_model.dart';

import '../repositories/plan_contract_repo.dart';

class PlanContractApi extends PlanContractRepo {
  @override
  Future<List<PlanContractModel>> getPlanContract() async {
    List<PlanContractModel> plansContractList = [];
    try {
      return await HttpService.getRequest(
        endPoint: Strings.getPlanContractEndPoint,
      ).then(
        (value) {
          value.data.forEach((element) {
            plansContractList.add(PlanContractModel.fromJson(element));
          });
          return plansContractList;
        },
      );
    } catch (error) {
      return plansContractList;
    }
  }
}
