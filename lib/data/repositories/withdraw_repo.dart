import 'package:hash_store/data/models/withdraw_model.dart';

abstract class WithdrawRepo {
  Future<dynamic> postWithdraw(WithdrawRequestModel withdrawRequestModel);
  Future<List<WithdrawResponseModel>> getWithdraw();
}
