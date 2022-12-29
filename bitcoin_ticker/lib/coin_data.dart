import 'dart:html';

import 'package:bitcoin_ticker/services/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = "F24D4713-E665-4DB9-970B-64086C88787C";
const coinApiUrl =
    "https://rest.coinapi.io/v1/exchangerate/"; //BTC?invert=false&apikey=F24D4713-E665-4DB9-970B-64086C88787C"
// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=F24D4713-E665-4DB9-970B-64086C88787C

class CoinData {
  Future<dynamic> getCoinExchangeRates(String coin, String currency) async {
    NetworkHelper networkHelper =
        // NetworkHelper("$coinApiUrl$coin?apikey=$apiKey&invert=false");
        NetworkHelper("$coinApiUrl$coin/$currency?apikey=$apiKey");

    var coinExchangeRates = await networkHelper.getCoinData();
    return coinExchangeRates;
  }
}
