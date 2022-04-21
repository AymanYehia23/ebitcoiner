import 'package:hash_store/data/models/plans_model.dart';

abstract class PlansRepo {
  Future<PlansModel> getPlans(String cryptoName, String planType);
  Future<String> addPlanContract(String planId, String currency);
}
