import 'package:hash_store/data/models/asics_model.dart';

abstract class AsicsRepo {
  Future<List<AsicModel>> getAsics();

  Future<dynamic> addAsicContract(String asicID, String currency);
}
