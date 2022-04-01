import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/data/repositories/delete_account_repo.dart';
import 'package:meta/meta.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this._deleteAccountRepo) : super(DeleteAccountInitial());

  //Business logic
  final DeleteAccountRepo _deleteAccountRepo;

  Future<void> deleteAccount(
      {required String password, required String? refreshToken}) async {
    emit(DeleteAccountLoadingState());
    try {
      await _deleteAccountRepo.requestDeleteAccount(
        password: password,
        refreshToken: refreshToken,
      );
      emit(DeleteAccountSuccessState());
    } on DioError catch (error) {
      emit(DeleteAccountErrorState());
      return error.response!.data;
    }
  }
}
