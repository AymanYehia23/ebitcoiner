import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/enums.dart';

class CurrencyConverter {
  Dio dio = Dio(
    BaseOptions(baseUrl: "https://rest.coinapi.io/v1/", headers: {
      'X-CoinAPI-Key': 'C7F88831-426D-4FEF-AAB6-CF0B3A93721F',
    }),
  );


  Future<dynamic> getCryptocurrencyPerUSDPrice(
      {required String currencyType}) async {
    try {
      final res = await dio.get(
        'exchangerate/$currencyType/USD',
      );
      return res.data['rate'];
    } on DioError catch (error) {
      return error.response!.data;
    }
  }

  Future<String> convertCryptocurrencyToUSD(
      {required Currency currencyType, required double? currencyAmount}) async {
    if (currencyType == Currency.btc) {
      double btcPerUSD =
          await getCryptocurrencyPerUSDPrice(currencyType: 'BTC');
      final result = currencyAmount! * btcPerUSD;
      return result.toString();
    } else if (currencyType == Currency.eth) {
      double ethPerUSD =
          await getCryptocurrencyPerUSDPrice(currencyType: 'ETH');
      final result = currencyAmount! * ethPerUSD;
      return result.toString();
    } else {
      double rvnPerUSD =
          await getCryptocurrencyPerUSDPrice(currencyType: 'RVN');
      final result = currencyAmount! * rvnPerUSD;
      return result.toString();
    }
  }
}
