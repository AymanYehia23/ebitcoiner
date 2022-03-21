part of 'delete_account_cubit.dart';

@immutable
abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoadingState extends DeleteAccountState{}

class DeleteAccountSuccessState extends DeleteAccountState{}

class DeleteAccountErrorState extends DeleteAccountState{}
