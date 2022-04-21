part of 'assets_cubit.dart';

@immutable
abstract class AssetsState {}

class AssetsInitial extends AssetsState {}

class AssetsGetUserDataLoadingState extends AssetsState {}

class AssetsGetUserDataSuccessState extends AssetsState {}

class AssetsGetUserDataErrorState extends AssetsState {}

class AssetsGetTotalProfitLoadingState extends AssetsState {}

class AssetsGetTotalProfitSuccessState extends AssetsState {}

class AssetsGetTotalProfitEmptyState extends AssetsState {}

class AssetsGetPlanContractLoadingState extends AssetsState {}

class AssetsGetPlanContractSuccessState extends AssetsState {}

class AssetsGetPlanContractErrorState extends AssetsState {}

class AssetsTotalChangeSizeState extends AssetsState {}

class AssetsChartLoadingState extends AssetsState {}

class AssetsChartSuccessState extends AssetsState {}

class AssetsChartBtcState extends AssetsState {}

class AssetsChartEthState extends AssetsState {}

class AssetsChartLTCTState extends AssetsState {}

class AssetsChartBtcDataState extends AssetsState {}

class AssetsChartEthDataState extends AssetsState {}

class AssetsChartLTCTDataState extends AssetsState {}
