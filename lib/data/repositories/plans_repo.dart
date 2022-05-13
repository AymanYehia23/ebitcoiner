import 'package:hash_store/data/models/plan_model.dart';

abstract class PlansRepo {
  Future<PlansResponseModel> getPlans({required PlansRequestModel plansRequestModel});
}
