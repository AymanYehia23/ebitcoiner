import 'package:hash_store/data/models/deposit_model.dart';
import 'package:hash_store/data/repositories/deposit_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';

class DepositApi implements DepositRepo {
  @override
  Future<DepositAddressResponseModel> getDepositAddress(
      {required DepositAddressRequestModel depositAddressRequestModel}) async {
    return await HttpService.getRequest(
            endPoint:
                'transaction/getdepositaddress?currency=${depositAddressRequestModel.currency}')
        .then((value) => DepositAddressResponseModel.fromJson(value.data));
  }

  @override
  Future<List<DepositModel>> getDeposits() async {
    List<DepositModel> depositResponseList = [];
    return await HttpService.getRequest(endPoint: Strings.getDepositsEndpoint)
        .then(
      (value) {
        value.data.forEach((element) {
          depositResponseList.add(DepositModel.fromJson(element));
        });
        return depositResponseList;
      },
    );
  }
}
