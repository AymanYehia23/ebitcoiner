import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/enums.dart';

class CurrencyConverter {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://min-api.cryptocompare.com/",
      headers: {
        'api_key':
            '3ccbc9d8557b907ce54e3c11dd330b350210fbe96c21adb82361f58a15d4a21a',
      },
      connectTimeout: 15000,
      receiveTimeout: 15000,
    ),
  );

  Future<dynamic> getCryptocurrencyPerUSDPrice(
      {required String currencyType}) async {
    try {
      final res = await dio.get(
        'data/price?fsym=$currencyType&tsyms=USD',
      );
      return res.data['USD'];
    } on DioError catch (_) {
      return 0.0;
    }
  }

  Future<double> convertCryptocurrencyToUSD(
      {required Currency currencyType, required double? currencyAmount}) async {
    if (currencyType == Currency.btc) {
      double btcPerUSD =
          await getCryptocurrencyPerUSDPrice(currencyType: 'BTC');
      final result = currencyAmount! * btcPerUSD;
      return result;
    } else if (currencyType == Currency.eth) {
      double ethPerUSD =
          await getCryptocurrencyPerUSDPrice(currencyType: 'ETH');
      final result = currencyAmount! * ethPerUSD;
      return result;
    } else if (currencyType == Currency.rvn) {
      double rvnPerUSD =
          await getCryptocurrencyPerUSDPrice(currencyType: 'RVN');
      final result = currencyAmount! * rvnPerUSD;
      return result;
    } else {
      double ltctPerUSD =
          await getCryptocurrencyPerUSDPrice(currencyType: 'LTC');
      final result = currencyAmount! * ltctPerUSD;
      return result;
    }
  }
}
