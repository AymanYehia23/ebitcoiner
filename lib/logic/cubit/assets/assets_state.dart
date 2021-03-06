part of 'assets_cubit.dart';

@immutable
abstract class AssetsState {}

class AssetsInitial extends AssetsState {}

class AssetsGetUserDataLoadingState extends AssetsState {}

class AssetsGetUserDataSuccessState extends AssetsState {}

class AssetsGetUserDataErrorState extends AssetsState {
  final String errorMessage;
  AssetsGetUserDataErrorState({
    required this.errorMessage,
  });
}

class UnauthorizedAssetsState extends AssetsState {}

class AssetsGetPlanContractLoadingState extends AssetsState {}

class AssetsGetPlanContractSuccessState extends AssetsState {}

class AssetsGetPlanContractErrorState extends AssetsState {
  final String errorMessage;
  AssetsGetPlanContractErrorState({
    required this.errorMessage,
  });
}

class AssetsTotalChangeSizeState extends AssetsState {}

class AssetsChartLoadingState extends AssetsState {}

class AssetsChartSuccessState extends AssetsState {}

class AssetsChartBtcState extends AssetsState {}

class AssetsChartEthState extends AssetsState {}

class AssetsChartRVNState extends AssetsState {}

class AssetsChartLTCTState extends AssetsState {}

class AssetsChartBtcDataState extends AssetsState {}

class AssetsChartEthDataState extends AssetsState {}

class AssetsChartRVNDataState extends AssetsState {}

class AssetsChartLTCTDataState extends AssetsState {}
