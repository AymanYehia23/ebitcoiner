import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/http/http_service.dart';
import 'package:ebitcoiner/data/models/withdraw_model.dart';
import 'package:ebitcoiner/data/repositories/withdraw_repo.dart';

class WithdrawApi implements WithdrawRepo {
  @override
  Future<List<WithdrawResponseModel>> getWithdraws() async {
    List<WithdrawResponseModel> withdrawResponseList = [];
    return await HttpService.getRequest(endPoint: Strings.getWithdrawsEndpoint)
        .then(
      (value) {
        value.data.forEach((element) {
          withdrawResponseList.add(WithdrawResponseModel.fromJson(element));
        });
        return withdrawResponseList;
      },
    );
  }

  @override
  Future<dynamic> postWithdraw(
    WithdrawRequestModel withdrawRequestModel,
  ) async {
    return await HttpService.postRequest(
      endPoint: Strings.withdrawRequestEndPoint,
      data: withdrawRequestModel.toJson(),
    ).then((value) => value.data);
  }
}
