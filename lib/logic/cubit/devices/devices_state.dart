part of 'devices_cubit.dart';

abstract class DevicesState {}

class DevicesInitial extends DevicesState {}

class GetAsicContractLoadingState extends DevicesState {}

class GetAsicContractSuccessState extends DevicesState {}

class GetAsicContractErrorState extends DevicesState {
  final String errorMessage;
  GetAsicContractErrorState({
    required this.errorMessage,
  });
}

class UnauthorizedDevicesState extends DevicesState {}

class DevicesChartBtcState extends DevicesState {}

class DevicesChartETHState extends DevicesState {}

class DevicesChartRVNState extends DevicesState {}

class DevicesChartLTCTState extends DevicesState {}
