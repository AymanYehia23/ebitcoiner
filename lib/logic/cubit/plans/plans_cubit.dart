import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/repositories/plans_repo.dart';

import '../../../data/models/plans_model.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit(this._plansRepo, this.plansModel) : super(PlansInitial());

  final PlansRepo _plansRepo;
  PlansModel plansModel;
  String cryptoName = 'BTC';
  String paymentCurrency = 'BTC';
  String planType = 'long';
  double firstRange = 0;
  double secondRange = 0;
  double thirdRange = 0;
  double fourthRange = 0;

  Future<void> getPlans() async {
    emit(GetPlansLoadingState());
    try {
      plansModel = await _plansRepo.getPlans(cryptoName, planType);
      getMinerCategory();
      emit(GetPlansSuccessState());
      //print(plansModel.plans![0].cryptoName);
    } on DioError catch (_) {
      emit(GetPlansErrorState());
      plansModel = PlansModel(plans: [], plansHashPower: []);
      //print(error.response!.data);
    }
  }

  Future<void> addPlanContract(String planId) async {
    emit(AddPlansLoadingState());
    try {
      await _plansRepo.addPlanContract(planId, paymentCurrency);
      emit(AddPlansSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(AddPlansErrorState());
    }
  }

  void getMinerCategory() {
    int sum = 0;
    double mid = 0;
    int lNum = plansModel.plans![0].price!;
    int mNum = 0;
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

    firstRange = lNum + 0.0;
    secondRange = (lNum + mid) / 2;
    thirdRange = (mNum + mid) / 2;
    fourthRange = mNum + 0.0;

    //print(
    //'First range: $firstRange\nSecond range: $secondRange\nThird range: $thirdRange\nFourth range: $fourthRange');
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
      emit(PlansBTCState());
    } else if (currency == Currency.eth) {
      paymentCurrency = 'ETH';
      emit(PlansETHState());
    } else if (currency == Currency.rvn) {
      paymentCurrency = 'RVN';
      emit(PlansRVNState());
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
      return 'assets/images/btc_icon.svg';
    } else if (cryptoName == 'ETH') {
      return 'assets/images/eth_icon.svg';
    } else if (cryptoName == 'RVN') {
      return 'assets/images/rvn_icon.svg';
    } else {
      return 'assets/images/ltct_icon.png';
    }
  }

  String minersPic(int price) {
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

  String unitOfPower() {
    if (cryptoName == 'BTC') {
      return 'TH/S';
    } else if (cryptoName == 'ETH') {
      return 'MH/S';
    } else {
      return 'MH/S';
    }
  }
}
