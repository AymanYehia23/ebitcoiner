import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/withdraw_model.dart';
import 'package:hash_store/data/repositories/withdraw_repo.dart';

class WithdrawApi implements WithdrawRepo {
  @override
  Future<List<WithdrawResponseModel>> getWithdraw() async {
    List<WithdrawResponseModel> withdrawResponseList = [];
    try {
      return await HttpService.getRequest(
              endPoint: Strings.getWithdrawsEndpoint)
          .then(
        (value) {
          value.data.forEach((element) {
            withdrawResponseList.add(WithdrawResponseModel.fromJson(element));
          });
          return withdrawResponseList;
        },
      );
    } on DioError catch (_) {
      return withdrawResponseList;
    }
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
