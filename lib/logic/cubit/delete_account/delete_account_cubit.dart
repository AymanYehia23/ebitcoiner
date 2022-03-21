import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hash_store/data/repositories/delete_account_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/secure_storage/secure_storage.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit({required this.deleteAccountRepo})
      : super(DeleteAccountInitial());

  //Business logic
  DeleteAccountRepo deleteAccountRepo;
  Future<String> deleteAccount(
      {required String password}) async {
    emit(DeleteAccountLoadingState());
    try {
      String res = await deleteAccountRepo.deleteAccount(
        password: password,
        refreshToken: await SecureStorage.getValue(key: 'refreshToken'),
      );
      await SecureStorage.deleteValue(key: 'accessToken');
      await SecureStorage.deleteValue(key: 'refreshToken');
      emit(DeleteAccountSuccessState());
      return res;
    } on DioError catch (error) {
      emit(DeleteAccountErrorState());
      return error.response!.data;
    }
  }
}
