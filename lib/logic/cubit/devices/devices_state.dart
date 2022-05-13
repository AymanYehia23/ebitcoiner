part of 'devices_cubit.dart';

abstract class DevicesState extends Equatable {
  const DevicesState();

  @override
  List<Object> get props => [];
}

class DevicesInitial extends DevicesState {}

class GetAsicContractLoadingState extends DevicesState {}

class GetAsicContractSuccessState extends DevicesState {}

class GetAsicContractErrorState extends DevicesState {
  final String errorMessage;
  const GetAsicContractErrorState({
    required this.errorMessage,
  });
}

class UnauthorizedState extends DevicesState{}

class DevicesChartBtcState extends DevicesState {}

class DevicesChartETHState extends DevicesState {}

class DevicesChartRVNState extends DevicesState {}

class DevicesChartLTCTState extends DevicesState {}
