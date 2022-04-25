import 'package:dio/dio.dart';
import 'package:hash_store/data/models/deposit_model.dart';
import 'package:hash_store/data/repositories/deposit_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';

class DepositApi implements DepositRepo {
  @override
  Future<DepositAddressModel> getDepositAddress(String currency) async {
    return await HttpService.getRequest(
            endPoint: 'transaction/getdepositaddress?currency=$currency')
        .then((value) => DepositAddressModel.fromJson(value.data));
  }

  @override
  Future<List<DepositModel>> getDeposits() async {
    List<DepositModel> depositResponseList = [];
    try {
      return await HttpService.getRequest(endPoint: Strings.getDepositsEndpoint)
          .then(
        (value) {
          value.data.forEach((element) {
            depositResponseList.add(DepositModel.fromJson(element));
          });
          return depositResponseList;
        },
      );
    } on DioError catch (_) {
      return depositResponseList;
    }
  }
}
