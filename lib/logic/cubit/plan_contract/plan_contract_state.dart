part of 'plan_contract_cubit.dart';

abstract class PlanContractState extends Equatable {
  const PlanContractState();

  @override
  List<Object> get props => [];
}

class PlanContractInitial extends PlanContractState {}

class GetPlansLoadingState extends PlanContractState {}

class GetPlansSuccessState extends PlanContractState {}

class GetPlansErrorState extends PlanContractState {
  final String errorMessage;
  const GetPlansErrorState({
    required this.errorMessage,
  });
}

class AddPlanContractLoadingState extends PlanContractState {}

class AddPlanContractSuccessState extends PlanContractState {}

class AddPlanContractErrorState extends PlanContractState {
  final String errorMessage;
  const AddPlanContractErrorState({
    required this.errorMessage,
  });
}

class PlanBTCState extends PlanContractState {}

class PlanETHState extends PlanContractState {}

class PlanRVNState extends PlanContractState {}
