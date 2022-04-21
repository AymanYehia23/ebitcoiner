import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/asic_contract_model.dart';
import 'package:hash_store/data/repositories/asic_contract_repo.dart';

class AsicContractApi implements AsicContractRepo {
  @override
  Future<List<AsicContractModel>> getAsicContract() async {
    List<AsicContractModel> asicContractList = [];
    try {
      return await HttpService.getRequest(
              endPoint: Strings.getAsicContractEndPoint)
          .then((value) {
        value.data.forEach((element) {
          asicContractList.add(AsicContractModel.fromJson(element));
        });
        return asicContractList;
      });
    } on DioError catch (_) {
      return asicContractList;
    }
  }
}
