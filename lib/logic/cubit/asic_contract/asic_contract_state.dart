part of 'asic_contract_cubit.dart';

abstract class AsicContractState extends Equatable {
  const AsicContractState();

  @override
  List<Object> get props => [];
}

class AsicContractInitial extends AsicContractState {}

class GetAsicsLoadingState extends AsicContractState {}

class GetAsicsSuccessState extends AsicContractState {}

class GetAsicsErrorState extends AsicContractState {
  final String errorMessage;
  const GetAsicsErrorState({
    required this.errorMessage,
  });
}

class AddAsicContractLoadingState extends AsicContractState {}

class AddAsicContractSuccessState extends AsicContractState {}

class AddAsicContractErrorState extends AsicContractState {
  final String errorMessage;
  const AddAsicContractErrorState({
    required this.errorMessage,
  });
}

class AsicsBtcState extends AsicContractState {}

class AsicsEthState extends AsicContractState {}

class AsicsRVNState extends AsicContractState {}

class AsicsLTCTState extends AsicContractState {}
