import 'package:hash_store/data/models/asic_model.dart';

abstract class AsicsRepo {
  Future<List<AsicModel>> getAsics();
}
