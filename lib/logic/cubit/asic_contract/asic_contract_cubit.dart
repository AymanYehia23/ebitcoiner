import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/models/asic_contract_model.dart';
import 'package:hash_store/data/models/asic_model.dart';
import 'package:hash_store/data/repositories/asic_contract_repo.dart';
import 'package:hash_store/data/repositories/asics_repo.dart';

part 'asic_contract_state.dart';

class AsicContractCubit extends Cubit<AsicContractState> {
  AsicContractCubit(this._asicsRepo, this._asicContractRepo)
      : super(AsicContractInitial());

  final AsicContractRepo _asicContractRepo;
  final AsicsRepo _asicsRepo;
  List<AsicModel> asicsList = [];
  String paymentCurrency = 'BTC';

  Future<void> getAsics() async {
    asicsList = [];
    String errorMessage = Strings.defaultErrorMessage;
    emit(GetAsicsLoadingState());
    try {
      asicsList = await _asicsRepo.getAsics();
      emit(GetAsicsSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(GetAsicsErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(GetAsicsErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> addAsicContract(String asicID) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(AddAsicContractLoadingState());
    try {
      await _asicContractRepo.addAsicContract(
        addAsicContractRequestModel: AddAsicContractRequestModel(
          asicID: asicID,
          currency: paymentCurrency,
        ),
      );
      emit(AddAsicContractSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else {
        errorMessage = 'No sufficient balance';
      }
      emit(AddAsicContractErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(AddAsicContractErrorState(errorMessage: errorMessage));
    }
  }

  void choosePaymentCurrency(Currency currency) {
    if (currency == Currency.btc) {
      paymentCurrency = 'BTC';
      emit(AsicsBtcState());
    } else if (currency == Currency.eth) {
      paymentCurrency = 'ETH';
      emit(AsicsEthState());
    } else if (currency == Currency.rvn) {
      paymentCurrency = 'RVN';
      emit(AsicsRVNState());
    }
  }

  String currencyIcon(int index) {
    if (asicsList[index].cryptoName == 'BTC') {
      return Strings.btcIcon;
    } else if (asicsList[index].cryptoName == 'ETH') {
      return Strings.ethIcon;
    } else if (asicsList[index].cryptoName == 'RVN') {
      return Strings.rvnIcon;
    } else {
      return Strings.ltctIcon;
    }
  }
}
