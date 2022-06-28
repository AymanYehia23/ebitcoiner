import 'package:ebitcoiner/data/models/asic_model.dart';

abstract class AsicsRepo {
  Future<List<AsicModel>> getAsics();
}
