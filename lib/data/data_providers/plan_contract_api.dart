import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/plan_contract_model.dart';

import '../repositories/plan_contract_repo.dart';

class PlanContractApi extends PlanContractRepo {
  @override
  Future<PlanContractsResponseModel> getPlanContract() async {
    try {
      return await HttpService.getRequest(
              endPoint: Strings.getDemoPlanContractEndPoint)
          .then(
        (value) {
          return PlanContractsResponseModel.fromJson(value.data[0]);
        },
      );
    } catch (_) {
      return PlanContractsResponseModel();
    }
  }
}
