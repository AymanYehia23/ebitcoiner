import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/models/plan_contract_model.dart';
import 'package:hash_store/data/repositories/plan_contract_repo.dart';
import 'package:hash_store/data/repositories/plans_repo.dart';

import '../../../data/models/plan_model.dart';

part 'plan_contract_state.dart';

class PlanContractCubit extends Cubit<PlanContractState> {
  PlanContractCubit(this._plansRepo, this._planContractRepo, this.plansModel)
      : super(PlanContractInitial());

  final PlansRepo _plansRepo;
  final PlanContractRepo _planContractRepo;
  PlansResponseModel plansModel;
  String cryptoName = 'BTC';
  String paymentCurrency = 'BTC';
  String planType = 'long';
  double firstRange = 0;
  double secondRange = 0;
  double thirdRange = 0;
  double fourthRange = 0;

  Future<void> getPlans() async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(GetPlansLoadingState());
    try {
      plansModel = await _plansRepo.getPlans(
        plansRequestModel:
            PlansRequestModel(cryptoName: cryptoName, planType: planType),
      );
      getMinerCategory();
      emit(GetPlansSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(GetPlansErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(GetPlansErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> addPlanContract(String planId) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(AddPlanContractLoadingState());
    try {
      await _planContractRepo.addPlanContract(
        addPlanContractRequestModel: AddPlanContractRequestModel(
          planId: planId,
          currency: paymentCurrency,
        ),
      );
      emit(AddPlanContractSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 400) {
        errorMessage = 'No sufficient balance';
      }
      emit(AddPlanContractErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(AddPlanContractErrorState(errorMessage: errorMessage));
    }
  }

  void getMinerCategory() {
    double sum = 0;
    double mid = 0;
    double lNum = plansModel.plans![0].price!;
    double mNum = 0;
    for (var element in plansModel.plans!) {
      if (element.price! < lNum) {
        lNum = element.price!;
      }
      if (element.price! > mNum) {
        mNum = element.price!;
      }
      sum += element.price!;
    }
    mid = sum / plansModel.plans!.length;

    firstRange = lNum;
    secondRange = (lNum + mid) / 2;
    thirdRange = (mNum + mid) / 2;
    fourthRange = mNum;
  }

  void chooseCurrency(Currency currency) {
    if (currency == Currency.btc) {
      cryptoName = 'BTC';
      getPlans();
    } else if (currency == Currency.eth) {
      cryptoName = 'ETH';
      getPlans();
    } else if (currency == Currency.rvn) {
      cryptoName = 'RVN';
      getPlans();
    } else {
      cryptoName = 'LTCT';
      getPlans();
    }
  }

  void choosePaymentCurrency(Currency currency) {
    if (currency == Currency.btc) {
      paymentCurrency = 'BTC';
      emit(PlanBTCState());
    } else if (currency == Currency.eth) {
      paymentCurrency = 'ETH';
      emit(PlanETHState());
    } else if (currency == Currency.rvn) {
      paymentCurrency = 'RVN';
      emit(PlanRVNState());
    }
  }

  void chooseContractPeriod(Period period) {
    if (period == Period.long) {
      planType = 'long';
      getPlans();
    } else {
      planType = 'short';
      getPlans();
    }
  }

  String currencyIcon() {
    if (cryptoName == 'BTC') {
      return Strings.btcIcon;
    } else if (cryptoName == 'ETH') {
      return Strings.ethIcon;
    } else if (cryptoName == 'RVN') {
      return Strings.rvnIcon;
    } else {
      return Strings.ltctIcon;
    }
  }

  String minersPic(double price) {
    if (price >= firstRange && price < secondRange) {
      return Strings.liteMainersImage;
    } else if (price >= secondRange && price < thirdRange) {
      return Strings.regularMinersImage;
    } else if (price >= thirdRange && price < fourthRange) {
      return Strings.proMinersImage;
    } else {
      return Strings.eliteMinersImage;
    }
  }
}
