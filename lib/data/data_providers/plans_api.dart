import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/plan_model.dart';
import 'package:hash_store/data/repositories/plans_repo.dart';

class PlansApi implements PlansRepo {
  @override
  Future<PlansResponseModel> getPlans(
      {required PlansRequestModel plansRequestModel}) async {
    return await HttpService.getRequest(
            endPoint:
                'plan?cryptoName=${plansRequestModel.cryptoName}&planType=${plansRequestModel.planType}')
        .then((value) => PlansResponseModel.fromJson(value.data));
  }
}
