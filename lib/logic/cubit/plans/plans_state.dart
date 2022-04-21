part of 'plans_cubit.dart';

abstract class PlansState extends Equatable {
  const PlansState();

  @override
  List<Object> get props => [];
}

class PlansInitial extends PlansState {}

class GetPlansLoadingState extends PlansState{}

class GetPlansSuccessState extends PlansState{}

class GetPlansErrorState extends PlansState{}

class AddPlansLoadingState extends PlansState {}

class AddPlansSuccessState extends PlansState {}

class AddPlansErrorState extends PlansState {}

class PlansBTCState extends PlansState{}

class PlansETHState extends PlansState{}

class PlansLTCTState extends PlansState{}
