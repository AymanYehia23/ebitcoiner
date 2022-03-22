part of 'assets_cubit.dart';

@immutable
abstract class AssetsState {}

class AssetsInitial extends AssetsState {}

class AssetsTotalChangeSizeState extends AssetsState{}

class AssetsChartLoadingState extends AssetsState{}

class AssetsChartBtcState extends AssetsState {}

class AssetsChartEthState extends AssetsState {}

class AssetsChartRvnState extends AssetsState {}



