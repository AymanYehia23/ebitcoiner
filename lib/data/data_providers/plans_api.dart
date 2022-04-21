import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/plans_model.dart';
import 'package:hash_store/data/repositories/plans_repo.dart';

import '../../core/constants/strings.dart';

class PlansApi implements PlansRepo {
  @override
  Future<PlansModel> getPlans(String cryptoName, String planType) async {
    return await HttpService.getRequest(
            endPoint: 'plan?cryptoName=$cryptoName&planType=$planType')
        .then((value) => PlansModel.fromJson(value.data));
  }

  @override
  Future<String> addPlanContract(String planId, String currency) async {
    return await HttpService.postRequest(
        endPoint: Strings.addPlanContractEndPoint,
        data: {
          'planID': planId,
          'currency': currency,
        }).then((value) => value.data.toString());
  }
}
