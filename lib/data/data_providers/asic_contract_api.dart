import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/http/http_service.dart';
import 'package:ebitcoiner/data/models/asic_contract_model.dart';
import 'package:ebitcoiner/data/repositories/asic_contract_repo.dart';

class AsicContractApi implements AsicContractRepo {
  @override
  Future<List<GetAsicContractResponseModel>> getAsicContract() async {
    List<GetAsicContractResponseModel> asicContractList = [];
    return await HttpService.getRequest(
      endPoint: Strings.getAsicContractEndPoint,
    ).then((value) {
      value.data.forEach((element) {
        asicContractList.add(GetAsicContractResponseModel.fromJson(element));
      });
      return asicContractList;
    });
  }

  @override
  Future<dynamic> addAsicContract({
    required AddAsicContractRequestModel addAsicContractRequestModel,
  }) async {
    return await HttpService.postRequest(
      endPoint: Strings.addAsicContractEndPoint,
      data: addAsicContractRequestModel.toMap(),
    ).then(
      (value) {
        return value.data;
      },
    );
  }
}
