import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/http/http_service.dart';
import 'package:ebitcoiner/data/models/asic_model.dart';
import 'package:ebitcoiner/data/repositories/asics_repo.dart';

class AsicsApi implements AsicsRepo {
  @override
  Future<List<AsicModel>> getAsics() async {
    List<AsicModel> asics = [];
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
  }
}
