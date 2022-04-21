import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/asics_model.dart';
import 'package:hash_store/data/repositories/asics_repo.dart';

class AsicsApi implements AsicsRepo {
  @override
  Future<List<AsicModel>> getAsics() async {
    List<AsicModel> asics = [];
    try {
      return await HttpService.getRequest(
        endPoint: Strings.getAsicsEndPoint,
      ).then(
        (value) {
          value.data.forEach((element) {
            asics.add(AsicModel.fromJson(element));
          });
          return asics;
        },
      );
    } catch (error) {
      return asics;
    }
  }

  @override
  Future<dynamic> addAsicContract(String asicID, String currency) async {
    return await HttpService.postRequest(
        endPoint: Strings.addAsicContractEndPoint,
        data: {'asicID': asicID, 'currency': currency}).then((value) {
      return value.data;
    });
  }
}
