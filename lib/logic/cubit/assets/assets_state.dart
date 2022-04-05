part of 'assets_cubit.dart';

@immutable
abstract class AssetsState {}

class AssetsInitial extends AssetsState {}

class AssetsGetTotalProfitLoadingState extends AssetsState {}

class AssetsGetTotalProfitSuccessState extends AssetsState {}

class AssetsGetTotalProfitErrorState extends AssetsState {}

class AssetsGetPlanContractLoadingState extends AssetsState{}

class AssetsGetPlanContractSuccessState extends AssetsState {}

class AssetsGetPlanContractErrorState extends AssetsState {}

class AssetsTotalChangeSizeState extends AssetsState{}

class AssetsChartLoadingState extends AssetsState{}

class AssetsChartBtcState extends AssetsState {}

class AssetsChartEthState extends AssetsState {}

class AssetsChartRvnState extends AssetsState {}



