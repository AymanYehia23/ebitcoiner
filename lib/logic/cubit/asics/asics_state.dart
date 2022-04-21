part of 'asics_cubit.dart';

abstract class AsicsState extends Equatable {
  const AsicsState();

  @override
  List<Object> get props => [];
}

class AsicsInitial extends AsicsState {}

class GetAsicsLoadingState extends AsicsState {}

class GetAsicsSuccessState extends AsicsState {}

class GetAsicsErrorState extends AsicsState {}

class AddAsicContractLoadingState extends AsicsState{}

class AddAsicContractSuccessState extends AsicsState {}

class AddAsicContractErrorState extends AsicsState {}

class AsicsBtcState extends AsicsState{}

class AsicsEthState extends AsicsState {}

class AsicsLTCTState extends AsicsState {}


