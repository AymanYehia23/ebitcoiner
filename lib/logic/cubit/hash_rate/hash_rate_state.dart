part of 'hash_rate_cubit.dart';

abstract class HashRateState extends Equatable {
  const HashRateState();

  @override
  List<Object> get props => [];
}

class HashRateInitial extends HashRateState {}

class HashRateGetPlanContractLoadingState extends HashRateState {}

class HashRateGetPlanContractSuccessState extends HashRateState {}

class HashRateGetPlanContractErrorState extends HashRateState {
  final String errorMessage;
  const HashRateGetPlanContractErrorState({
    required this.errorMessage,
  });
}

class HashRateGetTotalPowerLoadingState extends HashRateState {}

class HashRateGetTotalPowerSuccessState extends HashRateState {}

class HashRateGetTotalPowerEmptyState extends HashRateState {}

class HashRateTotalChangeSizeInitState extends HashRateState {}

class HashRateTotalChangeSizeState extends HashRateState {}

class HashRateExpiredChangeSizeInitState extends HashRateState {}

class HashRateExpiredChangeSizeState extends HashRateState {}
