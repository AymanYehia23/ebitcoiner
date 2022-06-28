import 'package:ebitcoiner/data/models/update_password_model.dart';

abstract class UpdatePasswordRepo {
  Future<dynamic> putUpdatePassword({required UpdatePasswordModel updatePasswordModel});
}
