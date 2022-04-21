part of 'hash_rate_cubit.dart';

abstract class HashRateState extends Equatable {
  const HashRateState();

  @override
  List<Object> get props => [];
}

class HashRateInitial extends HashRateState {}

class HashRateGetTotalPowerLoadingState extends HashRateState{}

class HashRateGetTotalPowerSuccessState extends HashRateState {}

class HashRateGetTotalPowerEmptyState extends HashRateState {}

class HashRateTotalChangeSizeInitState extends HashRateState {}

class HashRateTotalChangeSizeState extends HashRateState {}

class HashRateExpiredChangeSizeInitState extends HashRateState {}

class HashRateExpiredChangeSizeState extends HashRateState {}

